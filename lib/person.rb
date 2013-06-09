class Person
	attr_accessor :name, :born
	def initialize(name, json_data)
		@name = name
		useful_text = json_data["AbstractText"]
		@born = find_born(useful_text)
	end

	def find_born(text)
		/born.*(\d\s.*\d\d\d\d)/.match(text)[1]
	end
end