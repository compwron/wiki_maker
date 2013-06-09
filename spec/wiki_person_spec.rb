require_relative "../lib/person"
require_relative "../lib/wiki_person"

describe WikiPerson do
	data = {"AbstractText" => "born 3 July 1971 in Australia"}
	person = Person.new("name", data)
  	subject { WikiPerson.new person}

  it "should print markup with date" do
  	 subject.to_s.should include "Birth date|1971|7|3|"
  end

  it "should print markup with country of nationality" do
  	subject.to_s.should include "| nationality = Australia" # prettification todo: "Australian" not "Australia"
  end

  it "should not error on markup generation when date is not available" do
  	person_without_date_info = Person.new("name", "info")
  	wiki_person = WikiPerson.new(person_without_date_info)
  end
end
