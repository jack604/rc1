#sql retrieve function

def find_person
	puts "Enter name or ID of person to find:"
	id = gets.chomp

	person = $db.execute("SELECT* FROM people WHERE name = ? OR id = ?", id, id.to_i).first #Inte helt felfri men...

	unless person #if not person==true => if person==false?
		puts "No result found"
		return
	end

	puts %Q{
	Name: #{person['name']}
	Job: #{person ['job']}
	Gender: #{person ['gender']}
	Age: #{person ['age']}
	}
end

#find_person

	#Känns inte helt perfekt programmeringsstil tycker jag.


#Blev lite inspirerad av det här programmet och informationen i databasen eftersom det kunde typ tolkas som en database-record av en alien och det typ skapade idéer eller vad man ska säg. Man skapade nästan en liten story omkring den typ. Också hur outputen var utformad påverkade tror jag.
#ok, vad det gäller att veta om en idé är bra eller inte, ibland så kan man använda känseln istället för kalla ekonomiska kalkuleringar om något kommer att vara bra eller inte.
#Om man har grundfakta rätt så kan man typ använda känselt att det här känns roligt eller så för att veta om något kommer bli populärt eller användbart typ.

