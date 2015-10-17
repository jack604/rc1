#yaml

#som pstore men text based. Också lite annorlunda:

require 'yaml'
class Person
attr_accessor :name, :age
end
fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45
laura = Person.new
laura.name = "Laura Smith"
laura.age = 23
test_data = [ fred, laura ]
#puts YAML::dump(test_data) #konverterar till yaml-syntax. (skriv till fil?)
fred2 = Person.new
laura2 = Person.new

test_data = [ fred2, laura2 ]


yaml_string = <<END_OF_DATA
----  !ruby/object:Person
age: 45
name: Jimmy
- !ruby/object:Person
age: 23
name: Laura Smith
END_OF_DATA

ys2="""
---
- !ruby/object:Person
  name: Fred Bloggs
  age: 45
- !ruby/object:Person
  name: Laura Smith
  age: 23
"""
#Ok, skriv bara in det som skrivs ut "and you're laughing".

test_data2 = YAML::load(ys2)
#puts "writing yaml"
puts test_data[0].class
puts test_data[1].name
#Ok, verkar inte fungera.

#reading and writing Yamil to/from files:
@a
File.open("yaml.rb","r") { |f| @a= f.read } #Ok, så detta är tydligen att läsa in en fil... hmm... minns bara att File.open krånglade från boken.
b=File.open("yaml.rb", "r")
c=b.read #ok, ett annat sätt att läsa filen, tydligare tycker jag.
#c är sträng innehållande filinnehållet
#b är ett klassobjekt.
puts @a.class
#puts @a  #Ok, så den läser in hela filen i en string.
puts c.class
#puts c

#Testing writing to file:
out=File.open("output.yaml","w")
yamldata=YAML::dump(test_data)
out.write(yamldata)
