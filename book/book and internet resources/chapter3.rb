#Bra reference:
#https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls
#Typ yield, .call, code blocks och så.
#http://ruby-doc.org/core-2.2.0/Proc.html#method-i-call
#Bra info om .call method och Proc 

#Questions och kolla igen:
#?? Hashes Within Hashes, sid 67


#Chapter 3
#Loop:
5.times do puts "Test" end
#the same with curly brackets, use brackets for one lines and do/end for multiple lines.
5.times { puts "Test" }

#Iterators
#In Ruby, one mechanism to create a loop is called an iterator. An iterator is something that progresses through a list of items one by one. In this case it loops, or iterates, through five steps, resulting in five lines of “Test.” Other iterators are available for numbers, such as the following:
1.upto(5) { |a| puts "#{a}" } #finns även downto och step
#What isn’t obvious is how to get hold of the number being iterated upon at each step of the way so that you can do something with it in the looped code. What if you wanted to print out the current iteration number? How could you develop a counting program with these iterators? Simply, you pass the state of the iteration to the looped code as a parameter, like above:
#The easiest way to understand it is that the code between do and end is the code being looped upon. At the start of that code, the number from the “1 up to 5” count is sent down a chute into a variable called number. You can visualize the “chute” with the bars surrounding number. This is how parameters are passed into blocks of code that don’t have specific names (unlike methods on classes and objects, which have names). (a block is the { ... }-part or do ... end-part)

#Iterating arrays:
#Iterating through arrays is simple and uses the each method. The each method goes through each element of the array and passes it as a parameter to the code block you supply. For example:
[1, "test", 2, 3, 4].each { |element| puts element.to_s + "X" }

#Exempel och info hur man ska tänka när man kör iterators, t.ex. each:

[1,2,3,4,5].each { |number| puts number }
#In this case, you create a temporary array containing the numbers one through five and use the each iterator to pass each value into the code block, assigning each value to number that you then print to the screen with puts.
#Alltså det enda man vet är att alla element i arrayen kommer att köras igenom det där lilla kodblocket.

#Interpelation (strings)
puts "1+4 equals #{1+4}"

#Regular expressions fungerar som vanliga regular expressions i t.ex. sed och vim:
#Substitutions, One thing you’ll often want to do is substitute something within a string for something else. Take this example:
puts "this is a test".sub('s', 'B')
#global subsitution (substitute all found matches)
puts "this is a test".gsub('s', 'B')
#more advanced:
x = "This is a test"
puts x.sub(/^../, 'Hello')

#Iteration with a Regular Expression:
#Previously, you used iterators to move through sets of numbers, counting from 1 to 10 for example. What if you want to iterate through a string and have access to each section of it separately? scan is the iterator method you require:
"xyz".scan(/./) { |letter| puts letter }
"This is a test".scan(/../) { |x| puts x }
"This is a test".scan(/\w\w/) { |x| puts x } #\w maches only letters and digits
#Se table 3-4 i boken sid 54.

#also, using scan without codeblock returns an array of all matching strings
p "testing this is another test, An array of strings should be created".scan(/..../)

#extract numbers form a string:
"The car costs $1000 and the cat costs $10".scan(/\d+/) { |x|  puts x } #+ matches as many characters in a row as possible. For more modifiers, see table 3-5 sid 55.
#Character classes:
"This is a test".scan(/[aeiou]/) { |x| puts x } #scans through all the vowels in a string. or any characters inside the \[...\]-part
#Som de andra programmen typ.

#Check for matching (returns true or false): the =~ operator.
puts "String has vowels" if "This is a test" =~ /[aeiou]/
#the .match method:
puts "String has vowels" if "This is a test".match("[aeiou]")
#This functionality is useful if the regular expression is supplied by a user, or loaded in from a file or other external source rather than hard coded.



#OBS!!!
#In regular expressions, if you surround a section of the expression with parentheses ( and ), the data matched by that section of the regular expression is made availableseparately from the rest.
x = "This is a test".match(/(\w+) (\w+)/)
#"match returns a MatchData object that can be accessed like an array." Hmm... inte exakt t.ex. each verkar inte finnas för MatchData.
#x.each { |w| puts w }
#The first element contains the data matched by the entire regular expression. However, each successive element contains that which was matched by each referenced section of the regular expression.

p x
p x.class
xA=x.to_a #converts MatchData to Array
print xA
xA.each { |el| puts el}

#Hashes:
#Arrays are collections of objects, and so are hashes.
#However, hashes have a different storage format and way to define each object within the collection. Rather than having an assigned position in a list, objects within a hash are given a key that points to them. It’s more like a dictionary than a list, as there’s no guaranteed order, but just simple links between keys and values. 

dictionary = { 'cat' => 'feline animal', 'dog' => 'canine animal' } #A basic hash with two entries:
puts "dictionary size: #{dictionary.size}"

puts dictionary['cat'] #Like arrays, you use square brackets to reference the element you wish to retrieve.

dictionary['cat'] = "fluffy animal" #You can even change values in the same way as an array:
puts dictionary['cat']

#?? It won’t be immediately useful to you, but it’s worth noting that both keys and values can be objects of any type. Therefore, it’s possible to use an array (or even another hash) as a key. This might come in useful when you’re dealing with more complex data structures in future.

#.each: With Arrays, you can use the each method to iterate through each element of the array. You can do the same with hashes.
#However, as hashes use keys for each element, there’s no guaranteed order of response:
xH = { "a" => 1, "b" => 2 , 'c' => 4}
xH.each { |key, value| puts "#{key} equals #{value}" } #The each iterator method for a hash passes two parameters into the code block: first, a key, and second, the value associated with that key.

#inspect Hashes:
puts xH.keys.inspect #.keys method, shows only the keys, (returns an array). Finns också .values fär värden.

#other methods: .delete, .delete_if (deletes conditionally), 
xH.delete_if { |key, value| value > 3 }


#Code blocks:
x = [1, 2, 3]
x.each { |y| print " ", y } #The each method accepts a single code block as a parameter. (Men verkar inte gå att ha inom perenteser så lite okonsist känns det)
#x.each({ |y| puts y }) #Detta gick inte.

#OBS!!!
#The each method accepts a single code block as a parameter. The code block is defined within the { and } symbols, or within do and end delimiters:
#The code between { and } or do and end is a code block, essentially an anonymous, nameless method or function. This code is passed to the each method that then runs the code block for each element of the array.
#You can write methods of your own to handle code blocks. For example:

def each_vowel(&code_block)
%w{a e i o u }.each { |vowel| code_block.call(vowel) }
end
each_vowel { |vowel| puts vowel }

def each_vowel2(&myProc)
%w{a e i o u }.each { |element_from_array| myProc.call(element_from_array) ; p myProc.class } #här anropas både myProc alltså kodblocket som skickats till each_vowel2 och sedan även egna funktioner här p myProc.class
end
each_vowel2 { |vowel| puts vowel }
each_vowel2 { |vowel| p vowel }
each_vowel2 { |vowel| puts vowel.upcase }


#Ok, typ myProc blir ett Proc-objekt som i sin tur har .call method.
#Det .call gör i detta fall är att köra sig själv helt enkelt med en inparameter vowel
#det som anropas här är kodblocket efter each_vowel2 alltså { |vowel| puts vowel }
#så .call i första each_vowel2-anropet är { |vowel| puts vowel }

#kodblock är något som kan vara bra att ha koll på om man ska förstå dessa saker på en djupare nivå. det som står efter .each är också ett kodblock (tror jag)

#yield:
#An alternate technique is to use the yield method, which automatically detects any passed code block and passes control to it:
#This example is functionally equivalent to the last, although it’s less obvious what it does because you see no code block being accepted in the function definition. Which technique you choose to use is up to you.
def each_vowel
	%w{a e i o u}.each { |vowel| yield vowel }
end
each_vowel { |vowel| puts vowel }

#?Hur fungerar det med flera inparametrar?
#antar att det är som om det vore typ 
#se filen yield.


#Store code blocks inside variables Lambda method:
#It’s also possible to store code blocks within variables, using the lambda method:

print_parameter_to_screen = lambda { |x| puts x }
print_parameter_to_screen.call(100)

#konstigt att behöva göra lambda-metod men ok. T.ex. varför inte pr=Proc.new ; pr={ |z| puts z} eller liknande+	
#The term lambda is used due to its popularity elsewhere and in other programming languages. You can certainly continue to call them code blocks, and they are sometimes referred to as Procs













#scartchpad below
3.times { puts }


b=["hello", "world"]
b.each { |word| print word }

arr = [1, 2, 3, 4, 5]
arr.each { |a| print a -= 10, " " }

puts "Testing new"
a=[] #måste skapa arrayen först.
a[0]="hello"
a[1]="world"
p a
a.each { |word| puts word } 
