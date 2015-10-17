require 'rubygems'
require 'SQLite3'
#Ok, detta program använder sig av funktioner skrivna i andra filer: Dessa är de som finns i case-when-delen i programmet.

require '.\sql_basics'
require '.\sql_read'

$db=SQLite3::Database.new('dbfile')
$db.results_as_hash=true


loop do
puts %q{Please select an option:
	1. Create people table
	2. Add a person
	3. Look for a person
	4. Quit}

case gets.chomp
	when '1','c'
		File.exists?('dbfile') ? puts("Table already exists, will not create table") : create_table #Väldigt specifik med syntaxen här. Lite skeptisk till okonsistent specificitet med syntaxen.
	when '2','a'
		add_person
	when '3','f'
		find_person
	when '4','q'
		disconnect_and_quit
	end
end


