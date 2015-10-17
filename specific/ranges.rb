#Ranges, used to express natural consecutive sequences, t.ex. 1..20, 'a'..'z'
#? är det en typ eller en opjekttyp?
#two dots -> all included
#three dots -> end excluded.

#1..10 -> 1,2,...,10
#1...10 -> 1,2,...,9

#why not arrays:
#easy to create.
#efficient, only start and end stored.
#(can be converted to an array with to_a)
#used for conditions and intervals.

r=1..3
puts r.max #=> 3
puts r.include? 2 #=> true

#??? Hur fungerar detta, kolla upp === igen. Och ranges att de inte är nödvändigtvis räknas som heltal alltid.
puts (1...10)===5.3 # does this range include 5.3? => true
puts ('a'...'r')==="r" #=>false (r excluded)

puts (1...10)
print (1...10).to_a, "\n"

p ('k'..'z').to_a.sample(2) #måste konvertera till array först i detta fall.

age=55.2
case age
	when 0..12 then puts "still a baby"
	when 13...99 then puts "Teenager at heart!"
	else puts "You are getting older"
end
