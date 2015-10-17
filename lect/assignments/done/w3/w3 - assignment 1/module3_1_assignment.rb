require 'httparty'
require 'pp'

class Recipe
	include HTTParty
	base_uri 'http://food2fork.com/api'
	key_value=ENV['FOOD2FORK_KEY']
	hostport=ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"

	default_params key: key_value #tar en hash som input (specificera med key1: value1, key2: value2)
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