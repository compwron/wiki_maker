class Person
	require 'date'
	attr_accessor :name, :born
	def initialize(name, json_data)
		@name = name
		useful_text = json_data["AbstractText"]
		@born = find_date(find_born(useful_text))
	end

	def find_born(text)
		/born.*(\d\s.*\d\d\d\d)/.match(text)[1]
	end

	def find_date(text_date)
		Date.parse(text_date)
	end
end