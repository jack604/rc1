require '.\myexternalsource' #ok för typ egen fil så måste ange .\ först
#require_relative 'myexternalsource'
#load '.\myexternalsource.rb' #fungerade inte heller med fil i valfri katalog typ

extfunc("hello")

#Ruby stores the list of directories to search for included files in a special variable
#called $:. You can see what $: contains by default, using irb:

#env variable $: with directories to search for source files in.
puts $:.join(", ")
#to add directories to this:
$:.push '/your/directory/here'

#require and load both act like normal code in Ruby programs. You can put them at any point in your Ruby code and they’ll behave as if they were processed at that point.

#A commonly used shortcut uses arrays to quickly load a collection of libraries at once. For example:
#%w{file1 file2 file3 file4 file5}.each { |l| require l }
#But this makes it harder to read, speciellt om man alltid håller på såhär och håller på med massa "fiffiga" saker.

#Nested inclusions, load och require fungerar som att man kopierat koden direkt till filen.
#i alla fall, man kan load och require från filer som man i sig load och require (kan man göra en loop?)