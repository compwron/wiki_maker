class Person
	require 'date'
	require 'countries'

	attr_accessor :name, :born, :nationality
	def initialize(name, json_data)
		@name = name
		useful_text = json_data["AbstractText"]
		@born = find_date(find_born(useful_text))
		@nationality = find_nationality(useful_text)
	end

	def add_data(text)
		if @born.nil? then @born = find_date(find_born(text)) end
		if @nationality.nil? then @nationality = find_nationality(text) end
	end

	def find_nationality(text)
		countries = Country.countries #is there a ruby gem which proveis a long list of all country names? 
		countries.each {|country|
			country_name = country.first
			if /#{country_name}/.match(text) then return country_name end
		}
		nil
	end

	def find_born(text)
		/born.*(\d\s.*\d\d\d\d)/.match(text)[1]
	end

	def find_date(text_date)
		Date.parse(text_date)
	end
end