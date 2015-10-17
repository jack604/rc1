#man kan addera metoder till en klass lite när man vill typ.
class Myclass
	def a
		puts "a"
	end
end

class Myclass
	def b
		puts "b"
	end
end

class Myclass
	attr_accessor :name
	def age=(getage)
		@age=getage
	end
	def age
		@age 
	end
	def info=(getinfo)
		if getinfo != "ar-"
			@info=getinfo
		else
			@info="butterfly"
		end
	end
	def info
		@info
	end

	def initialize(name, age, moreinfo)
		@name=name
		@age=age
		@moreinfo=moreinfo
		@unknown=0
		self.info="ar-"
		info=("ar-")
	end
	def createvar
		@newvar=1
	end
end


m=Myclass.new("a",10,"no more info")
m.a
m.b
m.name="hej"
puts m.methods.join ", "
puts m.instance_variables.join ", " #Räknas om de är i initialize-metoden typ, de behöver inte specificeras via input arguments men behöver typ få ett värde verkar det som.
m.createvar
puts m.instance_variables.join ", " #Nej, de behövar bara typ finnas.
puts m.info

m.age=10
puts m.age

#Example class that uses all the concepts:
class Person
	def initialize(age, name)
		@age=age
		@name=name
		@info="no info yet"
	end
end
