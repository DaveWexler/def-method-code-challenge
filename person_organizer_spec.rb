require_relative 'person_organizer'
require_relative 'person'

describe "person_organizer" do
  describe "#create_person_objects" do
    before(:each) do
      Person.all = []
    end

    it "successfully creates a Person from a comma separated line" do
      line = ["Berry, Chuck, Male, Blue, 10/18/1926"]
      create_person_objects(line)
      expect(Person.all.last.firstname).to eq("Chuck")
    end

    it "successfully creates a Person from a pipe separated line" do
      line = ["Berry | Chuck | A | M | Blue | 10-18-1926"]
      create_person_objects(line)
      expect(Person.all.last.firstname).to eq("Chuck")
    end

    it "successfully creates a Person from a space separated line" do
      line = ["Berry Chuck A M 10-18-1926 Blue"]
      create_person_objects(line)
      expect(Person.all.last.firstname).to eq("Chuck")
    end
  end
end
