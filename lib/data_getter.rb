class DataGetter
	require 'json'
	require_relative "person"
	# this is intended to be the layer that somehow googles a passed-n name and creates a Person object
	def initialize(name)
		@name = name
		@sample_data = JSON.parse(hit_search(concatenate_name(name)))
		find_more_data()
	end

	def hit_search(name)
		api_url = "https://api.duckduckgo.com/?q=#{name}&format=json" # Could not resolve host
		response = `curl --silent "#{api_url}"`
		if (response.empty?) then 
			puts "No internet access, cannot get data - please fix connection and try again"
			return "{}"
		end
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