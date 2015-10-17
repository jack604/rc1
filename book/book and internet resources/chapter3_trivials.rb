#(bra) references:
#Basics   https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Literals
#arrays   http://ruby-doc.org/core-2.2.0/Array.html


#output methods:
#for everything almost
el=[1,2,3]
p el
print el, "\n"
puts el.inspect #skriver t.ex. ut 
#only for strings
puts "can only output strings i think"
puts el.to_s #converts to string
#Dock t.ex. Time object konverteras automatiskt till string när man använder puts.

#constants:
#created by giving it a name starting with a capital letter.
#also: The eagle-eyed reader might recall that in Chapter 2 you referred to classes by names such as Dog and Cat, beginning with capital letters. This is because once a class is defined, it’s a constant part of the program and therefore acts as a constant too.

#Strings:
#All strings in Ruby are objects of the String class, as you can discover by calling a string’s class method and printing the result:
puts "Hello, world!".class
#String literal:
#When a string is embedded directly into code, using quotation marks as earlier, the construction is called a string literal. This differs from a string whose data comes from a remote source, such as a user typing in text, a file, or the Internet. Any text that’s preembedded within a program is a string literal.
#Multiple lines string literal
x = %q{This is a test
of the multi
line capabilities}
puts "x is:\n#{x}\n"
#You can use anything in place of { and }

y = %q!This is a test
of the multi
line capabilities!
puts "y is:\n#{x}\n"
#Another way to build up a long string literal is by using a here document, a concept found in many other programming languages. It works in a similar way to the previousexample, except that the delimiter can be many characters long. Here’s an example:
x = <<END_MY_STRING_PLEASE
This is the string
And a second line
END_MY_STRING_PLEASE
#In this case, << marks the start of the string literal and is followed by a delimiter of your choice. The string literal then starts from the next new line and finishes when the delimiter is repeated again on a line on its own. Using this method means that you’re unlikely to run into any problems with choosing a bad delimiter, as long as you’re creative!

#operators on strings, t.ex. +, *, < (jämvör ascii-värdena antar en efter en), =

#Ascii value of character:
puts ?x #Fungerar inte. ska visa 120
puts 120.chr
puts "hello"=="hello", "A"<"Z"

#Convert string to nunmber and back.
puts 10.to_s=="10"
puts "10.4".to_i
puts "10.4".to_f

#String methods, t.ex. .downcase, .reverse, .upcase, .reverse, .length, .sub (substitute), gsub (multiple substitutions), .to_i, .to_f


#Arrays: Mer (bra) info http://ruby-doc.org/core-2.2.0/Array.html
xA = [1, 2, 3, 4]	#created
yA = []
zA = Array.new
yA[0]="Hello"
yA[1]="World"
yA << "new element" #pushes an element to the end of the array, same as .push method.

yA.each { |el| puts el } #iterates over every element in the array and uses el as placeholder for the elements.
#there are also .pop functions (but no >> function?)

#collect method, changes the array being iterated upon.
a=[1, 2, 3, 4]
p a.each { |element| element * 2 }
p a.collect { |element| element * 2 }
puts a.inspect
a.collect! { |element| element * 2 }
puts a.inspect
#Tre nivåer typ: .each gör bara saker i kodblocket men returnerar inte en ny array.
#.collect returnerar en array där kodblocket är utfört på alla element
#.collect! ändrar arrayen direkt på samma sätt som .collect

#Iterator preferable to the old way i t.ex. C
#However, it should be immediately apparent to anyone why iterators, code blocks, and methods such as each and collect are preferable with Ruby, as they make the code significantly easier to read and understand.

#Ok, verkar som att collect inte sparar resultatet. Ok, det finns också .collect!

#other methods: .join('<separator string>'), .split(<regexp that matches what you want should be the (sub)string that splits the string>), också minns scan som splittar strings into arrays.

#vanliga operationer som +, -, * fungerar också andra metoder: .empty, .include?(element), .first, .last, .reverse
#join: If you pass a numeric parameter to first or last, you’ll get that number of items from the start or the end of the array:
x = [1, 2, 3,4,5,6,7]
puts x.first(5).join(",")


puts "Short sentence. Another. No more.".split(/\./).inspect
#kom ihåg att det är regular expressions så man måste escape punkten alltså backslash före \.
#inspect är typ något som skriver ut objektet typ.

#split is also happy splitting on newlines, or multiple characters at once, to get a cleaner result.

#inspect: The inspect method is common to almost all built-in classes in Ruby and it gives you a textual representation of the object. For example, the preceding output shows the result array in the same way that you might create an array yourself. inspect is incredibly useful when experimenting and debugging!

#Iterating arrays, se chapter3.rb

#Det nedanför BEGIN och END är inte från boken (ej heller från lectures tror jag)

#Begin och end blocks:
#Every Ruby source file can declare blocks of code to be run as the file is being loaded (the BEGIN blocks) and after the program has finished executing (the END blocks).

BEGIN { 
  # BEGIN block code 
  puts "BEGIN code block"
} 

END { 
  # END block code 
  puts "END code block"
}
  # MAIN block code 
#puts "MAIN code block"
#A program may include multiple BEGIN and END blocks. BEGIN blocks are executed in the order they are encountered. END blocks are executed in reverse order. When executed, above program produces the following result:
#man kan ha flera BEGIN och END blocks. de körs i ordning som de är skrivna, uppifrån och ner.

#Flow control:
# ?-operator, the trenary operator:
#The ternary operator makes it possible for an expression to contain a mini if/else statement. It’s construction that’s entirely optional to use, and some developers are oblivious to its existence.
age=10
type = age < 18 ? "child" : "adult" #if true, return left side, if false return right side.
#Obs att denna operator returnerar något.
puts "You are a " + (age < 18 ? "child" : "adult") #ytterligare ett exempel.


#case:
#boken körde bara ena typen. den som motsvarar === vid jämförelsena. (enligt coursera-kursen)

#one line if:
puts "You're too young to use this system" if age < 18 #typ special eller vad man ska säga.

#while och until:
x = 1
while x < 100
puts x
x = x * 2
end

x = 1
until x > 99
puts x
x = x * 2
end

#båda har typ samma condition om man tänker efter.

i = 1
i = i * 2 until i > 1000 #one line loop
puts i


#Time class:
puts Time.now #Time object converted to string automatically.
puts Time.now - 10 #You can manipulate time objects by adding and subtracting numbers of seconds to them.

#Fixnum class? vad är det. some developers extend the Fixnum class with some helper methods to make manipulating dates easier:
#"Don’t worry if this code seems confusing and unfamiliar, as we’ll be covering this type of technique more in the following chapters."
class Fixnum
def seconds
self
end
def minutes
self * 60
end
def hours
self * 60 * 60
end
def days
self * 60 * 60 * 24
end
end
puts Time.now
puts Time.now + 10.minutes
puts Time.now + 16.hours
puts Time.now - 7.days


#Time.local(year, month, day, hour, min, sec, msec)	#The Time class also allows you to create Time objects based on arbitrary dates:
#The preceding code creates a Time object based on the current (local) time zone. All arguments from month onward are optional and take default values of 1 or 0. You can specify months numerically (between 1 and 12), or as three-letter abbreviations of their English names.

#Ok mer trivia om time. ev. kolla senare.
#Men obs: If you want to change elements of a date or time, you’ll either need to add or subtract seconds, or construct a new Time object using Time.gm or Time.local.

#Ev. kolla Chronic library att konvertera daglig text till tid typ. Eller vad det var. Kapitel 16.


rice_on_square = 1
64.times do |square|
puts "On square #{square + 1} are #{rice_on_square} grain(s)"
rice_on_square *= 2
end

#Ruby går seamlessly mellan små och stora nummer. Två olika klasser, Fixnum och Bignum
puts 1073741823.class
puts 1073741824.class #går precis över gränsen vid detta nummer.

#Ranges: Range is a class.
#the Range class offers a simple way to convert a range into an array with to_a:
array_of_letters=('A'..'Z').to_a
array_of_letters.each { |letter| print letter }

#range methods: .include, 

#You can also use ranges as array indices to select multiple elements at the same time: 
a = [2, 4, 6, 8, 10, 12]
puts a[1..3].inspect #typ istället för enskilt a[1], a[2], a[3]
a[1..3] = ["a", "b", "c"] #fungerar också att enge värden för en array på det sättet.
puts a.inspect
















#kolla senare-saker:
#Ranges: You can use ranges with objects belonging to many different classes, including ones you create yourself.


#Symbols, Converting between classes, Summary



