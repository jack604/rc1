#Storing objects, object persistence och marshalling
#bara för att spara och ladda objekt helt enkelt, inga andra fancy funktionalitet.

require 'pstore'
store=PStore.new("mystorage.pstore")

class Person
	attr_accessor :name, :job, :gender, :age
end

fred=Person.new
fred.name="Fred Flintstone"
fred.age=29

laura=Person.new
laura.name="Laura Smith"
laura.age=32

store.transaction do
	store[:people] ||=Array.new
	store[:people]<<fred
	store[:people]<<laura
end

#Ok, så key är vilken typ array eller table eller vad man ska säga som man vill spara raderna i samma key används när man vill läsa raderna. Man läser alla rader på en gång in i en array eller vad det är
#och det är en array med objekt.

