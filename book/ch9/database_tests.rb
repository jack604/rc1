#CSV comma separated values
require 'csv'

#can put a line in an array (each value is separate)

#vilka metoder behövs? läsa och skriva, fil och string/array.

cfile=CSV.open('csv.txt','r')
#do |runner|
#	puts runner.class
#	p runner
#	puts runner.inspect
#	puts runner.inspect
#end
puts cfile.class
cfile.each do |row|
	p row
end
#Ok, nu vet jag lite bättre hur CSV-objekt fungerar, jag tror det var boken som var inte så bra typ.

#Ok, CSV-objekt är typ nästan som ett fil-objekt jag tror det fungerar lite som det.


require 'csv'
people = CSV.parse(File.read('csv.txt'))
puts people[0][0]
puts people[1][1]
p people

runners=CSV.read('csv_speedrunners.txt')

puts runners.inspect


runnerfound=runners.find { |runner| runner[0] =~ /sinister/} #enumerable method.
puts
p runnerfound

#Change csv-file:
#read, change write back entire array.

#Maybe test later if nenessary:
