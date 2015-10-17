#Chapter6_trivial.rb
#the actual order of methods in code is irrelevant


#att använda en module och därmed dess klasser som standard kör bara include chosen-module där du står så slipper man använda chosen-module::myclass utan bara myclass.
#sid 167

#Struct (just syntactic sugar for easy creation of class with just attributes)
puts "hello"
Person = Struct.new(:name, :gender, :age)
fred = Person.new("Fred", "male", 50)
chris = Person.new("Chris", "male", 25)
carl = Person.new("carl" )

#Person motsvarar ungefär i struct är parametrarna optional när man skapar ett nytt objekt ??? sid 171 vet ej om det är gammalt eller så:
class Person2
	#attr_accessible
	attr_accessor :name, :gender, :age
	def initialize(name, gender, age)
		@name = name
		@gender = gender
		@age = age
	end
end

carl2= Person.new("carl2")
puts "world"