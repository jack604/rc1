#Hashes (in other languages also called dictionaries or maps)
#how, why, they are used.
#Silmilarity to blocks.

#important to master Hashes API!
#Documentation @ ruby-doc.org/core-2.2.0/Array.html


#indexed collections of object references
#created with either {}  or Hash.new
#Also known as associative arrays: index kan be anything, key, string, symbol.
#each element in the hash is associated with a key.

#accessed using [] operator.
#values in hash are set using:
# => for creating (hash-racket?) Ok, när den är skapad kan man använda [] för nya värden.
# [] when created.

#exempel:
editor_props = { "font"=>"Arial", "size" => 12, "color"=>"red"} #in this case, {...} is not a block, it means create hash, => means create key.

puts editor_props.length # => 3
puts editor_props["font"] # => Arial

editor_props["background"]="Blue" #kan sätta in nya värden med vanliga [] när den väl är skapad.
editor_props.each_pair do |key, value|
	puts "Key: #{key} value: #{value}"
end

#access non existent key gives nil

#create Hash with Hash.new(0) to return 0 instead of nil when accessing non initialized key.



wf=Hash.new(0)

sentence = "Chicka chicka boom boom"
sentence.split.each do |word|
	wf[word.downcase] +=1 #ok, så alla wf-element initieras till 0 så därför är det bara att plussa (och skapar samtidigt en ny key för varje olika ord i meningen)
end

p wf # => {"chicka" => 2, "boom" => 2}

#as of ruby 1.9 the order of putting things into hashes are maintained.

#if using sumbols as keys, can use symbol: syntax instead of the hash-racket (=>)? 

#if a Hash is last argument into a function, no need for {}, last argument not also including a block.

#!!!Kolla igen:
#Kolla mer om symbols och hashes i videon ca 8:00 och hash and symbols and order ca samma tidpunkt.
#blocks and hash init ambiguity (ruby interpreter can det confused):
#ca 9:30

#Hashes are indexed collections.
#usage is very similar to regular arrays
#although uncommon, can be confused for blocks.

#hmm... 45 minuter för bara den här videon... lite extra om collections och hash tables och liknande också.


