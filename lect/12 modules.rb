#modules

#module: container for classes, methods and constants (or other modules.)

#lik a class but cannot be instantiated. Class inherits from modules and adds new

#two purposes, namespaces or mixins.

#namespaces: t.ex. java har package structure to avoid name collisions between classes.
#t.ex. (java) org.package1.package2.myclas
#Ruby doesn't like having very deep module structure, men ändå något.


#namespaces:
module Sports 
  class Match
    attr_accessor :score 
  end 
end 

module Patterns 
  class Match 
    attr_accessor :complete 
  end 
end 

match1 = Sports::Match.new
match1.score = 45; puts match1.score # => 45

match2 = Patterns::Match.new
match2.complete = true; puts match2.complete # => true

#module as mixin:
#interfaces in OO (contract, defines what a class could do)

#mixin provide a way to share (mix-in) ready code among multiple classes. 
#ok, verkar ganska enkelt nu när man ser ett exempel. man bara inkluderar funktionalitet i en klass typ.
#kan inkludera kod från built in modules from ruby själv.
#enumberable module, används av t.ex. Array class (även andra). innehåller all grundläggande funktionalitet t.ex. map, select, reject, detect etc.
#kan inkludera i sin egen klass.
#genom att tillhandahålla en implementation av each method. sedan blir all annan funktionalitet automatiskt tillgängligt.


module SayMyName 
  attr_accessor :name 
  def print_name 
    puts "Name: #{@name}" 
  end 
end 

class Person 
  include SayMyName 
end 
class Company 
  include SayMyName 
end 

person = Person.new 
person.name = "Joe" 
person.print_name # => Name: Joe 
company = Company.new 
company.name = "Google & Microsoft LLC" 
company.print_name # => Name: Google & Microsoft LLC 


#mixin include exempel:

#det är ok att definiera flera klasser i en fil men ibland är det bra att ha en klass per fil.

# name of file - player.rb
class Player 

  attr_reader :name, :age, :skill_level

  def initialize (name, age, skill_level) 
    @name = name 
    @age = age
    @skill_level = skill_level 
  end

  def to_s 
    "<#{name}: #{skill_level}(SL), #{age}(AGE)>" 
  end 

end

#kolla de andra filerna i Lecture12-Modules



