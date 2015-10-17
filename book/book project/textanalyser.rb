File.open("text.txt").each { |line| puts line } #Ok, each... det räknas som att varje rad är ett element typ.

#The split approach demonstrates a core tenet of Ruby (as well as some other languages, particularly Perl) that “There’s always more than one way to do it!” Analyzing different methods to solve the same problem is a crucial part of becoming a good programmer, as different methods can vary in their efficacy.

puts "this is a test".scan(/\w/).join('-')

puts "Test code! It works. Does it? Yes.".split(/\.|\?|!/).length #Splitting sentences


#Fråga:
#When developing software it’s always worth considering the likelihood of the software being extended or tweaked in the future and planning ahead for the possibility. Many development bottlenecks have occurred when systems were designed too rigidly to cope with changing circumstances! 

#kolla upp mer info om detta i boken igen sid 104
text = %q{Los Angeles has some of the nicest weather in the country.}
stop_words = %w{the a by on for of are with just but and to the my I has some}
words = text.scan(/\w+/)
key_words = words.select { |word| !stop_words.include?(word) }

#select method:
#The select method is a method available to all arrays and hashes that returns the elements of that array or hash that match the expression in the code block.

#negate expression:
#The exclamation mark (!) before the expression negates the expression (an exclamation mark negates any Ruby expression).

#Sid 105 tip:
#Don’t read on until that makes sense, as this type of single-line construction is common in Ruby programming.

#Eget:
f=File.open("oliver.txt")
p f
#f.each {|line| puts line}