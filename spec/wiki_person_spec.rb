require_relative "../lib/person"
require_relative "../lib/wiki_person"

describe WikiPerson do
	data = {"AbstractText" => "born 3 July 1971"}
	person = Person.new("name", data)
  	subject { WikiPerson.new person}

  it "should print markup with date" do
  	 subject.to_s.should include "Birth date|1971|06|03|"
  end
end
