require 'rubygems'
require 'SQLite3'

#Vet inte riktigt varför denna skapades? sid 264
def disconnect_and_quit
  $db.close
  puts "Bye!"
  exit
end

#You can run sqlite3 from the command line

#VARCHARs, means they’re variable-length character fields. In basic terms, it means they can contain strings.
#The number in brackets refers to the maximum length of that string, so the name column can hold a maximum of 50 characters.

#SQLite3 warning: SQLite is a reasonably pragmatic database, and it ignores most conventions relating to data types in SQL.

#dollar sign means global variable.
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true #forces SQLite to return data in a hash format rather than as an array of attributes (as with CSV).
#you can use $db in a similar way to the file handles, t.ec. $db.close to close database.

#"The database handle has been assigned to a global variable, $db, so that you can split your program into multiple methods without creating a class. You can therefore access the database handle, $db, from anywhere you wish."
#Är det det bästa sättet eller? Hur gör andra? Hur gör de flesta? Vad är normalt?

#$db.execute för att köra sql-kommandon.

def create_table
	puts "Creating people table"
	$db.execute %q{
		CREATE TABLE people (
			id integer primary key,
			name varchar(50),
			job varchar(50),
			gender varchar(6)
			age integer)
	}
end

def create_table2
puts "Creating people table"
$db.execute %q{
CREATE TABLE people (
id integer primary key,
name varchar(50),
job varchar(50),
gender varchar(6),
age integer)
}
end

def create_books
puts "Creating books table"
$db.execute %q{
CREATE TABLE books (
id integer primary key,
isbn varchar(50)
)
}
end

def add_person
	puts "Enter name:"
	temp = gets
	name = temp.chomp
	puts "Enter job:"
	job = gets.chomp
	puts "Enter gender:"
	gender = gets.chomp
	puts "Enter age:"
	age = gets.chomp
	$db.execute("INSERT INTO people (name, job, gender, age) VALUES (?,?,?,?)", name, job, gender, age)
end

#??? sid 266 det här med ? i första strängen i execute-metoden.

def add_book
	puts "Scan book:"
	isbn=gets.chomp
	$db.execute("INSERT INTO books (isbn) VALUES (?)", isbn)
end
#create_books #ok, now table is already created
def insert_books
	puts "insert book? y/n"
	keep=gets.chomp
	while keep=="y"
  	  puts keep.chomp
	  add_book
	  puts "insert book? y/n"
	  keep=gets.chomp
	end
end

#create_table2
def insert_person
	puts "insert name? y/n"
	keep=gets.chomp
	while keep=="y"
	  puts keep.chomp
	  add_person
	  puts "insert name? y/n"
	  keep=gets.chomp
	end
end


#Ruby performs an automatic substitution from the other parameters passed to execute into the placeholders. This acts as a way of securing your database. The reason is
#that if you interpolated the user’s input directly into the SQL, the user might type some SQL that could break your query. 
#??Vart får man mer information om detta?

#Retrieve data:
