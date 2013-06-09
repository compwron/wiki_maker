class DataGetter
	require 'json'
	require_relative "person"
	# this is intended to be the layer that somehow googles a passed-n name and creates a Person object
	def initialize(name)
		@name = name
		concatenated_name = concatenate_name(name)
		# use https://duckduckgo.com/api instead
		api_url = "https://api.duckduckgo.com/?q=#{concatenated_name}&format=json"
		# api_url = "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q="
		@sample_data = JSON.parse(`curl --silent "#{api_url}"`)

		find_more_data()
	end

	def find_more_data
		# if born on and nationality are empty, keep googling
		# need a time-out so it doesn't go on forever if there's nothing to find
		
	end

	def concatenate_name(name)
		name.split(" ").join("+")
	end

	def person
		Person.new(@name, @sample_data)
	end
end