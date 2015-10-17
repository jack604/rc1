#försök med egen enumerable-grej:

#Ok, kolla filen code_block_testing.rb i specific-katalogen. Strategin var gör först en lokal min-funktion och sedan testa att gör en min-funktion in ett annat scope (genom att använda module och sedan inkludera denna module).
#finns också lite kommentarer i denna kod.

module Justmin
	def min
		lnum=nil
		self.each do |number| #ok man anropar classens each-metod vilken i sin tur ... kommer för varje element i arrayen @numbers anropa arrayens each-metod och för varje element köra koden 
			lnum=number if lnum==nil	#som finns i do ... end blocket. self.each har en (dold) inargument som är ett kodblock. och det är det som skickas (osynligt) till 
			lnum= number < lnum ? number : lnum #så det här blocket kommer att köras med alla saker i det som i klassens each-metod kallas för element.
		end	#alltså kolla i klassens each-metod, varje element kommer att skickas och köras genom detta block typ.
		return lnum 	#jag tror det skulle vara lättare att förstå om man inte körde med den där automagiska syntaxen utan den som explicit använder sig av block som argument typ.
	end
end

#Ok, vad var det nu som hände...

class Somenumbers
	include Justmin

	def initialize(numbers)
		@numbers=numbers

	end
	def each #denna anropas av min hmm... är för trött just nu, kolla imorgon.
		@numbers.each { |element| yield element } #letters är en array och har each-metod.
	end

	def localmin
		lowestnumber=@numbers[0]
		@numbers.each { |number| lowestnumber=number if number < lowestnumber }
		lowestnumber
	end

	def putnumbers
		puts @numbers[0].class
	end
end

a=Somenumbers.new([1,2,7,3,7,5,2,11,-5])
a.putnumbers
p a.localmin

p a.min

