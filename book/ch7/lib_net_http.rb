#net/http
#HTTP stands for HyperText Transfer Protocol, and it’s the main protocol that makes the World Wide Web work, as it provides the mechanism by which Web pages, files, and other media can be sent between Web servers and clients.

#Typ hello world för http-program, laddar ner en htmlsida och skriver ut den.
require 'net/http'
#Net::HTTP.get_print('www.rubyinside.com', '/')

url = URI.parse('http://www.rubyinside.com/')
response = Net::HTTP.start(url.host, url.port) do |http|
http.get(url.path)
end
content = response.body

#Mer detaljer i kapitel 14.

#OpenStruct
#vet inte hur bra och användbart det var...
#Latare sätt att använda structs känndes det som.	

#Gems:
#Gems have names, version numbers, and descriptions.
#RubyGems must be installed, not automattically installed but the de facto standard. (installed if you use ine click install i windows)
#run gem fråm command line, just type: gem [options]

#It’s possible to install RubyGems in a local, user directory if you don’t have permission to install it system wide. To learn more about this, refer to the RubyGems documentation at http://docs.rubygems.org/.

#lista alla gems som finns i officiella listan: gem list --remote
#to browse, use: http://rubyforge.org/
#ev. gem query --remote --name-matches class

#gem install, might have to have root permissions when running this in linux.
#gem installation process sid 194

#to include ruby gems (se till att rätt gem är installerrad):
##require 'rubygems'
##require 'RedCloth'
#special eftersom ruby gems inte är del av standard ruby. sid 194

##r = RedCloth.new("this is a *test* of _using RedCloth_")
##puts r.to_html

#When RubyGems is loaded on the first line, the RubyGems library overrides the require method and enables
#it to be used to load gems as if they were normal, local libraries.
#require 'rubygems' is not required if you used windows one-click-install.

#fungerade perfekt i linux men inte i windows.

#att se om ett gem installerades korrekt:
require 'rubygems'
require 'hpricot'
puts "Hpricot installed successfully" if Hpricot

#Installing latest developer's build, more safe now than in the olden days.
#Although it’s still common practice to release libraries in fixed versions from time to time, the advent of test-driven development has made it practical and reasonably safe to use more up-to-date versions of libraries that the developer is actively working on.
#Therefore, you can choose to install the finished, fixed versions of the Hpricot gem from the default gem servers, or you can choose to install the “up to the minute” source version from the developer’s own gem server.
#Hpricot’s developers’ build is not stored on the default gem servers, but on a gem server maintained by the Hpricot developer himself. To access it, you only need to adjust the gem install command slightly:

#gem install hpricot --source code.whytheluckystiff.net

#"Running the prior command gives you a lot more options than installing from the default gem servers."

#Many projects have their own developer gem servers, so if you want to install experimental, cutting-edge versions of gems and libraries, refer to the project’s Web site for information on installing the edge/source/experimental versions

#updating gems: gem update #kan också specificera vilka gems man vill uppdatera. kan också nedgradera?



#Installing gems in windows:
#det var lite kommentarer om skillnad mellan windows och linux men orkade inte läsa.
#jag antar att det finns mer info om detta om man har tid men kanske bara ska börja använda cygwin eller linux direkt istället för windows.

