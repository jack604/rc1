# team.rb 
class Team 
  include Enumerable # LOTS of functionality

  attr_accessor :name, :players 
  def initialize (name) 
    @name = name 
    @players = [] 
  end 
  def add_players (*players) # splat 
    @players += players
  end 
  def to_s 
    "#{@name} team: #{@players.join(", ")}" 
  end 
  def each 
    @players.each { |player| yield player } #här är players en array (skapas i initialize-metoden)
  end 
end 


#yield betyder yield something to a block.
#också den där splat functionality...

#ok, 

#re