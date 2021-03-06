require_relative "../lib/person"

describe Person do
  sample_data = "Julian Paul Assange ( born 3 July 1971) is an Australian editor, activist, publisher and journalist."
  json_data = {"AbstractText" => sample_data}
  subject { Person.new "Julian Assange", json_data}

  it "should detect born date" do
  	subject.find_born(sample_data).should == "3 July 1971"
  end

  it "should guess nationality" do
  	subject.find_nationality(sample_data).should == "Australia"
  end

  it "should not error when born information is not available" do
    person_without_nationality = Person.new("name", "info")
    person_without_nationality.born.should == nil
  end
end
