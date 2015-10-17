#? questions: 

#object oriented applying knowledge in a scenario/example
#Dungeon text adventure: (requires a complete understanding of mapping real-world concepts into classes.)




#develop classes of what you´re trying to model:
#this example needs to deal with the following concepts:
# -A general class that encapuslates the entire concept of the dungeon game. (the dungeon class)
# -A class that provides the link between the virtual world and you (the eral person using the program). All experience of the virtual world comes through the player. (the player class)
# (not so general) -More specific locations in the virtual world (in this case rooms, are locations, can navigate between rooms, liked together t.ex. doors nort, east, west, south and have descriptions)

#Later:
#A complete adventure would also have concepts representing items, enemies, other characters, waypoints, spells, and triggers for various puzzles and outcomes. You could easily extend what you’ll develop into a more complete game later on if you wished to.


#Ok, jag tänkte mig en graf eller liknande men exempelprogrammet är designat lite annorlunda. Det söker till exempel igenom en hash-tabell varje gång
#spelaren vill byta rum.
#Har inte heller en referens till nuvarande rum utan söker upp rummet varje gång t.ex. man ska skriva ut info om det.
#Det här med reference och connections känns också lite not POLA


class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

  def start(location)
    @player.location = location
    show_current_description
  end

  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  def find_room_in_dungeon(reference)
    @rooms.detect { |room| room.reference == reference } #letar igenom room-arrayen efter samma referens som inargumentet. room.reference-metoden är definierad genom attr_accessor.
  end

  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction] #Ok, här är typ när man går till ett annat rum. find room in dungeon ska hitta en reference och returnera. det direction gör är att kollar current room's connection in the specified direction. connections har max fyra par, key är något väderstreck och value är en rferens.
  end 	#Vet inte hur man ska förklara på ett bra sätt... jag var tvungen att kolla igenom denna kod en del för att förstå.

  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

  class Player
    attr_accessor :name, :location

    def initialize(name)
      @name = name
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\n\nYou are in " + @description
    end
  end

end

# Create the main dungeon object
my_dungeon = Dungeon.new("Fred Bloggs")

# Add rooms to the dungeon
my_dungeon.add_room(:largecave, "Large Cave", "a large cavernous cave", { :west => :smallcave })
my_dungeon.add_room(:smallcave, "Small Cave", "a small, claustrophobic cave", { :east => :largecave })

# Start the dungeon by placing the player in the large cave
my_dungeon.start(:largecave)

my_dungeon.show_current_description
my_dungeon.go(:west)
my_dungeon.go(:east)
