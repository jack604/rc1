#classes, objects and are created, access data in objects.

#redan gått igenom lite från boken.

#instance variables not declared, spring into existance when first used.
#available to all instance methods in the class.

#new method creates and instance of class, new causes initialize.

#Object's state can be (should be) initialized inside the initialize method, the "constructor"

class Person
	def initialize (name, age) #Constructor
		@name = name
		@age = age
	end
	def get_info
		@additional_info = "Interesting"
		"Name: #{@name}, age: #{@age}"
	end
end

person1=Person.new("Joe", 14)
p person1.instance_variables
puts person1.get_info #skapar en ny instance variable när man anropar denna metod. Och denna sparas permanent.
p person1.instance_variables

#instance vars are private, methods have public access by default (access to the class' variables by default).
#getter and setter methods to read/change data in object.

#getters and setters are defined by using the same name of instance variable.

class Person
	def initialize (name, age) #Constructor
		@name = name
		@age = age
	end
	#get and set methods.
	def name #metod name, returnerar name.
		return @name
	end
	def name= (new_name)  #metod name= som ändrar instansvariabeln.
		@name = new_name
	end

	def get_info
		@additional_info = "Interesting"
		"Name: #{@name}, age: #{@age}"
	end
end

person2 = Person.new("John", 24)
puts person2.name
person2.name = "Mike" #specialfall med namnet, metoden heter name= men man kan ha space mellan name och likhetstecknet när man anropar funktionen.
puts person2.name
# puts person2.age #fungerar inte för det finns inte en age getter-metod i klassen ovan.

#easier syntax for getters and setters:

#use attr_* form instead.
#attr_accessor	creates both getter and setter
#attr_reader	creates getter
#attr_writer	-- " -- setter

class Person2
	attr_accessor :name, :age
end #constructor, getter and setter fixade automatiskt.
puts 
person3 = Person2.new
p person3.name
p person3.age
person3.name="Dan"
person3.age = 15
puts person3.name
puts person3.age
person3.age = "fifteen" #dynamic language visas här typ 7:00 classes lektionen.
puts person3.age

#Two issues med attr_accessor:
#1. unitinalized state beginning.
#2. control what value can be. t.ex. age under 150 kanske.

#solving: use a contructor and a more intelligent age setter:

#but fist: self
#used inside a setter method, refers to own object.
#usually, using self for calling other methods of the same instance is e
#hmm... anropar man en metod i ett objekt så är det typ alltid egna objektets metod och instansvariabler som används men ändå behövs self ibland...
#outside instance method definition, self refers to the class iteslf.

#Example:
class Person2
	attr_reader :age #bara reader för att man tillhandahåller egen setter-funktion.
	attr_accessor :name

	def initialize (name, ageVar)
		@name = name
		self.age = ageVar #call the age= method, alltså våran egen definierade setter method. Här använd self.
		puts age 	#varför anropas denna? vag gör den?
	end
	def age= (new_age)
		@age = new_age unless new_age > 120
	end
end

person4 = Person2.new("Kim", 13) # => 13
puts "My age is #{person4.age}" # => My age is 13
person4.age = 130 #Try to change the age
puts person4.age #=> 13 (change to 130 not allowed)

person5 = Person2.new("Kim5", 200) # => Not initalized but no error message.
puts person5.age
person5.age=20
puts person5.age


#??? varför anropas puts age i initialize-method?
#kolla igen typ 11:30 varför man använder self.

#Mer info om self här: https://en.wikipedia.org/wiki/This_(computer_programming)
#kanske här också under Disambiguation: http://www.jimmycuadra.com/posts/self-in-ruby/
#Också http://rubylearning.com/satishtalim/ruby_self.html

#summary:
#instance variables created with @varname
#getter and setter method names:
#variable name: var1
#getter name:   var1
#setter name:   var1=
#Också, när man anropar var1= så kan man ha space mellan var1 och = men inte när man definierar setter-metoden.
#undvik att ha mellanslag mellan namnet och likhetstecknet annars blir det ologiskt och man lär sig tänka fel typ.
#attr_*	extra syntax att komma ihåg för att slippa skriva så mycket.
#self, refer to object itself.
#

#Frågor: 8:30 fattade inte så mycket här typ.
#lite undrar 9:00 outside instance method definition?
#kan man inte döpa getter och setter metoderna till vad man vill?