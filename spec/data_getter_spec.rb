require_relative "../lib/data_getter"

describe DataGetter do

  it "should not error when no internet connection available" do
    data = DataGetter.new "Julian Assange"
  end
end
