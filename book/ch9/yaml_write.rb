#yaml write
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
bob = Person.new
bob.name="Bob n Ra<"
bob.age=18


test_data = [ fred, laura, bob ]


out=File.open("output.yaml","w")
yamldata=YAML::dump(test_data)
out.write(yamldata)