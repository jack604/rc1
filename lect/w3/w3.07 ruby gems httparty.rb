#gem: package manager t.ex. gem install ...
#gem list httparty
#gem install httparty

#restful web servides? simple web services implemented using HTTP (and principles of REST) that:
#1. have a base URI
#2. support data exchange format like XML or JSON (ev. others) (different formats representing the same resources)
#3. support a set of HTTP operations (GET, POST etc.)

#httparty restful web services client.
#automatinc parson of json and xml into ruby hashes

#info för att få igång denna:
#https://gist.github.com/fnichol/867550


#Httparty example:

require 'httparty'
require 'pp'


class Coursera
	include HTTParty
	debug_output $stdout 

	base_uri 'https://api.coursera.org/api/catalog.v1/courses'
	default_params fields: "smallIcon,shortDescription", q: "search"
	format :json

	def self.for term
		get("", query: { query: term})["elements"] #ok, andra argumentet är en hash vars value är en hash.
		#från httparty documentation: Request methods (get, post, patch, put, delete, head, options) all take a common set of options. These are:
		#sedan en lista där t.ex. query: är med.
		#alltså i fall hör den första query: till GET-metoden och den andra till det specifika API-et (courseras api).
		#förfrågningen blir:
		#"GET /api/catalog.v1/courses?fields=smallIcon%2CshortDescription&q=search&query=python HTTP/1.1\r\nAccept-Encoding: gzip;q=1.0,deflate;q=0.6,identity;q=0.3\r\nAccept: */*\r\nUser-Agent: Ruby\r\nConnection: close\r\nHost: api.coursera.org\r\n\r\n"
		#                             ---------   default_params  ---------------- -get andra arg-                
		# q borde heta något annat mer generellt, typ f för function eller något. Men jag vet inte hundra procent.
	end
end

got=Coursera.for "python"
puts "New line p and pp"
puts
puts
puts
#pp Coursera.for "python"
#pp Coursera.for "python"[0]['id']
#p Coursera.for "python"[0].class
#p Coursera.for "python"[0]['id'].class

#p got[0].class
#pp got[0]
#puts
#pp got[0]['id']

#puts
#puts
#pp got

#got.each {|el| pp el['name']}
puts
got.each {|el| pp el['name'];pp el['shortDescription'];puts}
