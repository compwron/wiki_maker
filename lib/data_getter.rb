class DataGetter
	require 'json'
	require_relative "person"
	# this is intended to be the layer that somehow googles a passed-n name and creates a Person object
	def initialize(name)
		# must put + between space-separated items
		@sample_data = JSON.parse(`curl --silent "http://ajax.googleapis.com/ajax/services/search/web?v=1.0&q=thoughtworks"`)
	end

	def person
		Person.new(@sample_data)
	end
end