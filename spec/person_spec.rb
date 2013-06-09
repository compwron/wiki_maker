require_relative "../lib/person"

describe Person do
  sample_data = "Julian Paul Assange ( born 3 July 1971) is an Australian editor, activist, publisher and journalist."
  json_data = {"AbstractText" => sample_data}
  subject { Person.new "Julian Assange", json_data}

  before do
  end

  it "should detect born date" do
  	subject.born.should == "3 July 1971"
  end
end
