#lecture trivials:
#require relative 'file' #relative pathway to include file (from the "current" file).
#splat, tror det blir en array av det som kommer in från ett splat-argument.

#Scope:
#rules:
#methods and classes begin new scope for variables (outer scope variables do not get carried over to the inner scope)
#local_variables-method to lsit which variables are in scope.

#constants:
#scope different! inner scope can se outer scope, can override outer vars but they stay the same once back outside.

#blocks:
#blocks inherit outer scope.
#variables created inside the block is only available to the block.
#parameters to the block ar always local to the block - even if they have the same name as variables in the outer scope.
#för att göra en variabel lokal, kör typ:
arr=[1,2,3]
outervar=10
arr.each do | num;outervar | #otherwise outervar would be changed also outside of this scope.
	outervar=20+num
end
puts
puts outervar


a=10
C=30
Myc=40
def newscopetest
	b=20
	puts "new scope #{b}"
	#puts "scope #{a}" #do not work!
	p local_variables #returns array
	p C
#	C=40 #ok, verkar inte kunna ge konstanten nytt värde.
end

newscopetest

p local_variables

p C

#Fungerar att ändra konstant i en klass men inte i en metod.
class Mc
	p Myc
	Myc=50
	p Myc
end

#hmmm... verkar fugnera inom module.
module MyMod
	MyConst = 'outer'
	class MyClass
		puts MyConst
		MyConst='inner'
		puts MyConst
	end
	puts MyConst
end
