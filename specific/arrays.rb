#Också, .size är antal element i arrayen (verkar vara oavsett hur stora elementen är eller vad de innehåller)
ar2_words = %w{what a great day today!}
puts ar2_words[-2]
puts "what day is it \# #{ar2_words.last}"

p ar2_words[-3, 2]
print ar2_words[-4, 2], "\n"

print ar2_words[2..4] , "\n" #range type covered later

puts ar2_words.join(',') #joins to a string with , between elements




#modifying arrays
#append: push or <<
#remove: pop or shift
#set: []= (this is a method to change element in an index)

#sort or reverse: sort, reverse med och without exclamation point.

#allt även stack och queue är arrays i ruby men finns metoder som gör att de underlättar stack och queue funktionalitet.
stack = []; stack << "one"; stack.push ("two")
puts stack.pop

#queue
q=[]; q.push "one"; q.push"two"
puts q.shift, q.shift

a=[5,3,4,2,7].sort!.reverse!
puts a
puts a.sample(2) #får två random elements från en array. (nice feature)

a[7] = 33 #=>[7,5,4,3,2,nil,nil,33] (Automatically expandable)
p a

#other useful array methods, each, select, reject, map, and many others
#see url: ruby-doc.org/core-2.2.0/Array.html
#each, iterator over the array (because iterator it takes a |block|)
#select, filter array by selecting
#reject, opposite of select
#map, maps every element to a new element???

a=[1,3,4,7,8,10]
a.each { |num| print num*2, " "}

atest=a
atest.select! {|num| num>4} #ok, fungerar det där också med exclamation mark.
print "\n", atest

new_arr = a.select {|num| num>4} #filter är conditionen i slutet num>4 i detta fall.
print "\n", new_arr #obs, new_arr är en nyskapad array, orginalarrayen a är fortfarande intakt

new_arr=a.select{|num| num<10}.reject{|num| num.even?} #a är en array som man kan köra en metod på som ger en array som man kan köra en metod (samma utbyd av metoder oavsett hur arrayen skapades typ om det inte finns specialfall eller så) på o.s.v.
p new_arr

#? är inte map samma som each ? Ok, verkar som att map är som each! (med utroppstecken) skulle vara om det fanns.
new_arr=a.map{|x| x*3}
a2=a.each{|x| x*3}

print "\n"
print a,"\n"
print new_arr, "\n"
print a2,"\n"
a.each{|x| print " ", x*3}


