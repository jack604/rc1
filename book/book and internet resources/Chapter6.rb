#Chapter6.rb
#Saker att kolla upp mer och frågor:
#Objektorienterad programmering allmännt (ev. också design)
#Vart får man/bör man skapa objekt-variabler?
#Typ om man skapar en objektvariabel i en annan metod skapas objektvariabeln endast när man anropar den metoden då eller?
#Om man vill ha koll eller överblick av programmet, kan man skapa en klass för det? T.ex. för garbage collection och så, lite mer system-aktiga saker. (Kanske inte behövs ens men...)
#? sid 142 it returns a string starting with Dr., appended with the name as usual.
#Känns som att boken "starts to sag" här.
#Kan man extenda en klass? typ lite när man vill? finns det någon anledning att göra det överhuvud taget?
#Det går och jag förstår varför. Man kanske vill overrida en funktion och så vill man inte behöve definiera om hela klassen typ. Men varför vill man göra detta överhuvud taget förresten?
#Det står också: This ability to reopen classes and add and redefine methods is relatively unique among object-oriented languages
#kallas detta to reopen classes?
#lite vagt: At a more technical level, encapsulation refers to the ability of objects to hide their constituent data behind an abstracted interface, and this ability is implicitly considered here.
#Om polymorphism (kopierad rad): Olika klasserna hade samma metodnamn så det gick att göra så men det känns inte riktigt vad polymorphism är... skulle vilja veta mer kanske.
#"being able to rely on most objects to return a string with to_s comes in particularly useful in many situations." (skulle vilja veta mer typ.)
#Ev. läs igen sid 157 om modules and namespaces.

#Ok, accepterade att bara använda Enumerable utan att riktigt förstå varför det fungerar men skulle fortfarance vilja veta mer om detta typ.


#encapsulation, hur fungerar det med instance variables? Kanske bara ska gå att komma åt via getters och setters?



#kolla sid 142 om varför detta kan vara användbart med att anropa parent methods. Och hur man gör i praktiken när man använder parent class' (mer generella funktionalitet) methods.

#Basics:
#Inheritance: t.ex. klassen 2dshape kan ha metoder som calculate area och omkrets. Kanske även egenskaper som position och orientering, färg?.
#Lite otydligt om area och omkrets ska vara metoder eller attribut. (Måste ändå finnas funktionalitet för uträkning av area och omkrets någonstans. Ska de vara i klassen eller någonstans utanför?)

#För att overrida en metod t.ex. String-obj.length så räcker det med att göra såhör:
class String #Ok så man behöver inte skapa en ny subklass och overrida utan man kan bara ändra metoden direkt som här.
	def length
		20
	end
end
#"However, this demonstration shows why it’s always necessary to tread with caution and be aware of what’s going on in your application."


#Ok, jag fattar shapes exemplet lite nu:
#oop sparar informationen (nästan som en lista) i själva objektet (det blir lite som convenience) så att man slipper komma ihåg dessa senare medans procedural inte gör det (jag tror det går att fixa på andra sätt ädnå).
#den andra saker är att oop innehåller metoderna som kan utföras på shapen också medans i procedural så blev det fyra metoder sammanlagt (antal funktioner per shape*antal shapes), med oop behöver man bara komma ihåg 2 metoder. (Men jag tror det går att fixa detta också, i alla fall för användaren, t.ex. med att provide shape som ett inargument)

#Förklaring: Förstod inte allt som stod där (sid 132) men några saker i alla fall:
#He also realizes that if a shape could be stored as an object referenced by a single variable, and that if each shape class accepted the
#same methods, the type of shape presented wouldn’t matter
#Förklaring: Lättare att använda, man vet att det är samma metoder oavsett shape, man vet att de alltid finns. Metoder som räkna ut area, räkna ut omkrets t.ex.

#OBS! metoder i ett objekt kan returnera data till anropande rad och behöver inte bara göra saker i sitt objekt och sedan accessar man med reader-method typ.


#Variable types, local, global, object, and class variables.
#Local variable:
def function1
	var1=10	#local variable. Only in this function's scope
	#Global variable:
	$gvar1=20
	#"They don’t mesh well with the ideals of object-oriented programming,""
end
puts $gvar1

#Instance Variables or object variables:
#object variables are so named because they have scope within, and are associated to, the current object.
#varje objekt har sin egen uppsättning av instansvariablerna. (till skillnad från class variables)
@ovar1 #inne i en klass. Här hamnar den i typ root-klassen. Kolla http://ruby-doc.org/core-2.2.3/Object.html för mer info om root-klassen.
#object variabler kan användas av vilken metod som helst i klassen.
#Vet inte riktigt när man får skapa objektvariabler men initialize-metoder och så kanske är bra ställen.

#class variables:
#The scope of a class variable is within the current class, as opposed to within specific objects of that class.
@@cvar1=30 #class variable.
#Class variables are particularly useful for storing information relevant to all objects of a certain class.
#For example, you could store the number of objects created so far in a certain class using a class variable.
#Passar att använda klass-metoder för att t.ex. printa ut klassvariabel (se klassmetoder nedan)
class Square
	def initialize
		if defined?(@@number_of_squares)
			@@number_of_squares += 1
		else
			@@number_of_squares = 1
		end
		#ovan kan förenklas med ?-operatorn: @@number_of_squares = defined?(@@number_of_squares) ?@@number_of_squares + 1 : 1
	end
end

#Class methods och instance methods:
#Class method kan anropas med klassnamnet utan att instansiera ett objekt innan medans instance method måste anropas med hjälp av ett objekt.
#skapa class method med self.
#def self.mymethod
#Går också att använda klassnamnet istället för self.

#Inheritance:

class ParentClass
	def method1
		puts "Hello from method1 in the parent class"
	end
	def method2
		puts "Hello from method2 in the parent class"
	end
end
class ChildClass < ParentClass
	def method2
		puts "Hello from method2 in the child class"
	end
end

my_object = ChildClass.new
my_object.method1

#Info om ovan:
#The first result demonstrates inheritance perfectly. ChildClass has no method1 of its own, but because it has inherited from ParentClass, and ParentClass has a method1, it uses it.
#However, in the second case, ChildClass already has a method2 method, so the method2 method supplied by the parent class is ignored. In many cases, this is ideal behavior, as it allows your more specific classes to override behavior provided by more general classes.

#?tiers


#in some situations you might want a child method to call an inherited method and do something with the result.

#Calling parent's methods (even if method is overriden):
class Person
	def initialize(name)
		@name = name
	end
	def name
		return @name
	end
end

class Doctor < Person
	def name
		"Dr. " + super #obs, super kommer returnera en string därfår fungerar detta.
	end
end

#super kommer att anropa metoden med samma namn som metoden som definieras i detta fall name.

class Gen
	def out1
		print "out1 called\n"
	end
end

class Gen
	def out2
		print "out2 called\n"
	end
end

g=Gen.new
g.out1

#Reflection
#Reflection is the name of the process by which a computer program can inspect, analyze, and modify itself while it’s running and being used. Ruby takes reflection to an extreme
#It’s possible to query almost any object within Ruby for the methods that are defined within it. This is another part of reflection.

a = "This is a test"
puts a.methods.join(', ')
#Another interesting method is instance_variables It returns the names of any instance variables associated with an instance (as opposed to class variables):

#Encasulation
#Låta vissa metoder bara vara nåbara från klassen själv. Alltså man kan inte utanför klassen anropa myobj.my_encapsulated_method() eller vad man ska säga.

#The rationale for encapsulation is that you should make as few methods available from your classes as possible, so that even if you choose to rewrite the internals of your classes, you can maintain a few methods that interface between other elements of your system and your classes and objects
#This can allow you to extend and change your classes without the worry that other elements of your application will break.


class Person
def initialize(name)
	set_name(name)
end
def name
	@first_name + ' ' + @last_name
end

private	#Man använder private för att encapsulata metoder.
def set_name(name)
	first_name, last_name = name.split(/\s+/) #\s a whitespace character. name.split returnerar en array som kan lagras i två variabler på detta sätt (om arrayen inte är två element lång då? vad händer då?)
	set_first_name(first_name)
	set_last_name(last_name)
end
def set_first_name(name)
	@first_name = name
end
def set_last_name(name)
	@last_name = name
end
end

#Man kan reverta tillbaka till publik metoddefinition med public.

#You can also use private as a command by passing in symbols representing the methods you want to keep private, like so:
#private :set_name, :set_first_name, :set_last_name
#note that in the preceding example the private declaration has to come after the methods are defined.

#Protected method:

class Person
def initialize(age)
@age = age
end
def age
@age
end
def age_difference_with(other_person)
(self.age - other_person.age).abs
end
protected :age
end

fred = Person.new(34)
chris = Person.new(25)
puts chris.age_difference_with(fred)
#puts "chris.call_age: #{chris.call_age}" #Error för att det går bara att anropa inom klassdefinitionen. ? eller anropas av ett objekt av klassen Person (här anropades det av ett objekt av "root-klassen")

class Person
	def call_age #Lägger till en metod som anropar en protected metod.
		self.age
	end
end
puts "chris.call_age: #{chris.call_age}"


#The preceding example uses a protected method so that the age method cannot be used directly, except within any method belonging to an object of the Person class. However,if age were made private, the preceding example would fail because other_person.age would be invalid. That’s because private makes methods accessible only by methods of a specific object. 

#Polymorphism: typ + kan användas på olika typer, string, number, ev. andra.
#Exempel på polymorphism (vet inte hur bra exemplet är men...)
class Animal
attr_accessor :name
def initialize(name)
@name = name
end
end
class Cat < Animal
def talk
"Meaow!"
end
end
class Dog < Animal
def talk
"Woof!"
end
end
animals = [Cat.new("Flossie"), Dog.new("Fido"), Cat.new("Tinkle")]
animals.each do |animal|
puts animal.talk
end


#Olika klasserna hade samma metodnamn så det gick att göra så men det känns inte riktigt vad polymorphism är... skulle vilja veta mer kanske.

#Fler exempel (inbyggda methods, här to_s):
puts 1000.to_s
puts [1,2,3].to_s
puts ({ :name => 'Fred', :age => 10 }).to_s

#"being able to rely on most objects to return a string with to_s comes in particularly useful in many situations." (skulle vilja veta mer typ.)

#Nested classes: som det låter. Används lite av samma anledning som private methods. d.v.s. när vissa objekt behövs användas av andra objekt men inte utanför.


#Examples:
class Drawing
class Line
end
class Circle
end
end

#From within Drawing, you can access the Line and Circle classes directly, but from outside the Drawing class, you can only access Line and Circle as Drawing::Line and Drawing::Circle. For example:

class Drawing
	def Drawing.give_me_a_circle
		Circle.new
	end

	class Line
	end

	class Circle
		def what_am_i
			"This is a circle"
		end
	end
end

a = Drawing.give_me_a_circle #metoden skapar ett nytt internt objekt circle. med hjälp av Circle.new och inte något typ :: och så.
puts a.what_am_i
a = Drawing::Circle.new #Går att skapa ett objekt med en "intern" klass med hjälp av ::
puts a.what_am_i
#a = Circle.new	#klassen Circle kommer inte att synas härifrån.
puts a.what_am_i



#The scope of constants:
#not global varaiables but available to all child classes. Unless you override them. (Kan definiera constants in the global scope (förstås))

Pi = 3.141592
class OtherUniverse
	Pi = 4
	def OtherUniverse.circumference_of_circle(radius)
		radius * 2 * Pi
	end
end

puts OtherUniverse.circumference_of_circle(10)
puts OtherUniverse::Pi #local pi =>4.5
puts Pi #Global pi => 3.141592

#Modules provide a structure to collect Ruby classes, methods, and constants into a single, separately named and defined unit. This is useful so you can avoid clashes with existing classes, methods, and constants, and also so that you can add (mix in) the functionality of modules into your classes.

#Modules:
#Ok, han börjar använda require utan att förklara det... chapter 6 verkar lite mer sloppy än de fåregående kapitlen.
#Förklarar inte heller rand()-metoden.

#Note: require is the Ruby statement used to load in code contained within another file. This is covered in detail in the next chapter.
#Men ändå bra läsning sid 157.

#Modules provide different namespaces: (Modules simply provide ways to organize methods, classes, and constants into separate namespaces.)
module NumberStuff
	def NumberStuff.random
		rand(1000000)
	end
end

#Nu finns (root-)metoden random i namespacen NumberStuff
#Komma åt saker i en namespace:
puts NumberStuff.random

#Det kan vara flera modules i en fil. Vet inte om en module över flera filer men skulle väl kunna vara så.

#För att komma åt classer i en namespace använder man ::

#Också om man inte använder modules så kommer t.ex. om man har klassdefinitioner med samma namn i flera filer så kommer deras kod att kombineras (och ibland override) till en klass.
module ToolBox
	class Ruler
		attr_accessor :length
	end
end

module Country
	class Ruler
		attr_accessor :name
	end
end

a = ToolBox::Ruler.new
a.length = 50
b = Country::Ruler.new
b.name = "Ghengis Khan from Moskau"
#Info about the new objects:
p a
p b


#2nd reason for modules: Mix-ins

module UsefulFeatures
def class_name #Obs att det vara är en metod som definieras, inte en klass.
	self.class.to_s #.class skickar tillbaka namnet på klassen (i detta fall self)
end
end

class Person9
	include UsefulFeatures #inkluderar allt i UsefulFeatures?
end

xyz = Person9.new
puts xyz.class_name


#Två typ "include" statemets: include inkluderar innehåll  och require (laddar innehåll från en annan fil)


#går också att includera direkt "into the current scope"
include UsefulFeatures
puts class_name


#Standard mix-ins:
#Ruby comes with several modules by standard that you can use. For example, the Kernel module contains all the “standard” commands you use in Ruby without getting involved with objects or classes, such as load, require, exit, puts, and eval.
#För att t.ex. anropa puts direkt från "golvet"
#Dessa metoder inkluderas (som standard) i alla objekt.

#Modules provided for us to include:
#Ruby provides modules that you can include into your own classes to gain more functionality immediately. Two such modules are Enumerable and Comparable.

#Ok, vad gäller enumerable, jag tror det fungerar såhär: När man kör den där each {... yield ... } så kommer varje... i slutändan kommer varje element ha skickats till det där code snippeten som man anropat typ.


#Exemplet sid 163 i boken: 
























































































