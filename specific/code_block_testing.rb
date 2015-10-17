#Code block testing:

x=[1,2,3]
x.each { |e| puts e }

#Ok, mål testa att göra en som enumerable så att man kan inclue min grej och sedan köra t.ex. .min på ett objekt.

#Hmm... så &code_block ska vara { |el| yield el } som skickas till min?

#Testar en modul för mixin:
module Justmin
	def min #(inarray) later try: self.each, ok verkade fungera. Hur får jag ett värde av in-datat? ok, måste väl använda indatat i form av el-variabeln typ. Man kan t.ex. använda den där initial?-metoden så att om inte initierad så initiera med el-variabeln sedan efter initierad gör jämförelsen typ.
		least=99999
		self.each { |el| least=el if el<least }
		least
	end
	def hellomodule
		puts "hello module"
	end
	def max #ok andra försöket testar closure om jag förstått det och om det fungerar. Hmm... vet inte om det är det som closure handlar om. Jag kan inte förklara varför om det inte är så dädrför har jag inte rikitgt 100% koll känns det som.
		most=-9999 #each-metoden måste användas på något sätt eller?
	end
end

module Another #Äh, jag orkar inte fortsätta med att kolla closures typ. Kanske någon annan gång.
	b=20
end

class Numberlist
	include Justmin

	def each #Ok, nu förstår jag. i ett array-objekt t.ex. så är datainnehållet inte särskillt komplicerat så...
		@the_list.each { |el| yield el ;p local_variables } #Har each-metoden overridats nu eller? Eller... aha, klassen hade ingen till att börja med men däremot @the_list har en each-metod.
	end #ok, klassens each och Array-objektets each, de är två olika.

	def initialize(inlist)
		@the_list=inlist
	end

	def outlist
		puts
		@the_list.each { |el| puts el  }
	end

	def localmin
		least=@the_list[0]
		#@the_list.each { |el| least=el if el<least }
		self.each { |el| least=el if el<least }
		least
	end
end

l=Numberlist.new([9,-4,3])

l.outlist
l.each { puts "hello yield called in Numberlist's each method with yield"}
puts "Ok mixin module seemed to work, hallelujah! minimal value is: #{l.min}"
#En fråga återstår: 

#puts
#puts "hello"
puts l.localmin	#ok, både .min och .localmin fungerar och båda använder self.each { codeblock } så ... det verkar fungera typ. Men när använder man closuers och dess egenskaper?
puts "l.min: #{l.min}"
#l.hellomodule
##puts l.min #([2,3,8])
##Ok, men hur får jag att jag så att den använder arrayen i objektet?

#Ok, modulen kan förvänta sig att en klass ska implementera en metod så...

#hmm... testa .each-metoden för Justmin:

a=[1,2,3].each
p a
p local_variables

#citat:  "if you understand yield, you can build all the methods in Enumerable." från https://practicingruby.com/articles/building-enumerable-and-enumerator


#bra info:
#yield returns the last evaluated expression (from inside the block). So in other words, the value that yield returns is the value the block returns.

#ok, jag lyckades fixa detta med hjälp av att testa each-metoden i mitt objekt.