class Recipe
	include HTTParty

	ENV['FOOD2FORK_KEY'] = '6664c8279fb8840e4bf2df7cee664445'
	key_value = ENV['FOOD2FORK_KEY']
	hostport  = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{hostport}/api"

	default_params key: key_value
	format :json

	def self.for (keyword)
		get("/search", query: {q: keyword}) ["recipes"]
	end
end

