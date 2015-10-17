#pstore load

require 'pstore'
#Ok, man måste specificera rätt objekt för att kunna läsa in detta objekt.
class Person
	attr_accessor :name, :job, :gender, :age
end

store=PStore.new("mystorage.pstore")
people=[]
store.transaction do
	people=store[:people]
end
p people
p people[1]
puts people[1].name
