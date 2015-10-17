#Mer info i Chapter 3.rb-filen i bokkatalogen.
#Jag tror inte detta är från boken eller ens från lectures.
#yield test:
#and blocks.


#yield blocktest

#blocktest

#Above produces nothing.

def blocktest
	puts "blocktest mehtod"
	yield
	#blocktest
end
blocktest{ puts "the block passed to blocktest is running now (started with the yield statement): hello you" ; puts "end of program"}
#Ok, blocktest {...} var tvungen att vara efter method blocktest.
#Nu förstår jag. blocktest är en metod och man anropar denna metod med ett kodblock som inparameter.
#Man skulle kunna ha inparametrar till yield också.
puts

def test
   puts "You are in the method"
   yield
   puts "You are again back to the method"
   yield
end
test {puts "You are in the block"}

puts

def test2
   yield 5
   puts "You are in the method test2"
   yield 100
end
test2 {|i| puts "You are in the block #{i}"}


#Pass more than one parameter:
#yield a, b
#test {|a, b| statement}

def test3(&arg1)
   arg1.call
end
test3 { puts "Hello World!"}
#Så typ arg1 blir test3-blocket och man anropar blocket med .call-metoden?
#Varför ska man göra det?


#Ok, kolla upp .each-funktionen också.