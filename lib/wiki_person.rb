class WikiPerson
	def initialize(person)
		@page_text = create_text(person)
	end

	def create_text(person) # need to parse bith date in order to put it in this format. 
		markup = "{{Infobox person
		 | name = #{person.name}"
		 if (!person.born.nil?) then 
		 	markup += "\n| birth_date = {{Birth date|#{person.born.year}|#{person.born.month}|#{person.born.day}|df=yes}}"
		 end

		 if (!person.nationality.nil?) then
		 	markup += "\n| nationality = #{person.nationality}"
		 end

		 markup += "}}"
	end

	def to_s
		@page_text
	end
end