#|| operator
#class methods and variables
#class inheritance

#|| if true, returns left side otherwise right side.
#kom ihåg att bara nil eller false är false allt annat är true.

#@x = @x || 5 #will return 5 first time and @x the next time.

#short form: @x ||= 5

#ok, i exemplet ca 1:30 varför inte bara använda function argument default values t.ex. age=(new_age=5)?


#Class methods and variables:

#three ways to define class mehtods
#class variables begin with @@

#when doesn't make sense to create a method for a specific class. (t.ex. allmänna math functions) Så self även i rubriken gör det till en class variable.
#triple är defined bara utanför någon class definition.
#times_called: använder class << self
#detta gör att times_called blir en class method. (vad exakt betyder class method?)
#använder också @@ för att skapa en class variable, ??vet inte, borde inte det automatiskt bli en class variable då den skapats i en << self -klass?

#Shows three ways to define class methods:
#first, self.double(var), self used outside of method definition. (Men ändå i method)
class MathFunctions 
  def self.double(var) # 1. Using self 
    times_called; var * 2; 
  end 
  class << self # 2. Using << self 
    def times_called 
      @@times_called ||= 0; @@times_called += 1 
    end 
  end 
end 
def MathFunctions.triple(var) # 3. Outside of class 
  times_called; var * 3 
end

# No instance created! 
puts MathFunctions.double 5 # => 10 
puts MathFunctions.triple(3) # => 9 
puts MathFunctions.times_called # => 3 


#class inheritance:



class Dog 
  def to_s 
    "Dog" 
  end 
  def bark 
    "barks loudly" 
  end 
end 
class SmallDog < Dog 
  def bark # Override 
    "barks quietly" 
  end 
end 

dog = Dog.new # (btw, new is a class method) 
small_dog = SmallDog.new 
puts "#{dog}1 #{dog.bark}" # => Dog1 barks loudly 
puts "#{small_dog}2 #{small_dog.bark}" # => Dog2 barks quietly 


#lägg märke till overiding.