require 'yaml'

class Person
  attr_accessor :name, :age
end

infile=File.open("output.yaml","r")

yamlstringdata=infile.read

myobjs=YAML::load(yamlstringdata)

myobjs.each {|obj| puts obj.name; puts obj.age}

#Ok, nu fattar jag.
#Skulle vilja ha lite bättre koll på hur det fungerar lite under huven men... alltså vad händer om man har ett objekt med andra keys typ. Ev. lära sig lite mer om symbols och så alltså :mysymbol t.ex.
#Typ hur dom läggs in i objekt.
#Allt kanske bara sker automatiskt om man håller sig till YAML::dump och YAML::read typ.



#parsed=YAML.load(File.open("output.yaml")) #från internet tutorial

#obj1=Person.new
#obj2=Person.new
#objects=[obj1, obj2]

#p infile.class
#puts yamlstringdata
#p parsed[0].name
#p objects[0]
#p obj1.name
#p obj1.age
#puts "hello"

