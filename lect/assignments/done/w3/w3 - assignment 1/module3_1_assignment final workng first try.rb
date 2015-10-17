require 'httparty'
require 'pp'

class Recipe
	include HTTParty
	base_uri 'http://food2fork.com/api'
	default_params key: "8d3aa21a49c2556acc6774b5ec97fa82" #tar en hash som input (specificera med key1: value1, key2: value2)
	format :json
	def self.for myquery
		complete=get("/search", query: {q: myquery})#base_uri redan definierad.
		complete["recipes"]
	end

end

a=Recipe.new

#ret=Recipe.for("apple")
#ret=Recipe.for("cardoon")["recipes"]
ret=Recipe.for("cardoon")

pp ret