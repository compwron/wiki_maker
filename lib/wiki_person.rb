class WikiPerson
	def initialize(person)
		@page_text = create_text(person)
	end

	def create_text(person)
		"{{Infobox person
		 | name = #{person.name}
  		 }}"
	end

	def to_s
		@page_text
	end
end