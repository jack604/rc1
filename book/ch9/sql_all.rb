require '.\sql_basics'
require '.\sql_read'

loop do
puts %q{Please select an option:
1. Create people table
2. Add a person
3. Look for a person
4. Quit}
case gets.chomp
when '1'
create_table
when '2'
add_person
when '3'
find_person
when '4'
disconnect_and_quit
end
end