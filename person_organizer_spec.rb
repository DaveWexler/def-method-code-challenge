require_relative 'person_organizer'
require_relative 'person'
require 'pry'


describe "person_organizer" do
  before(:each) do
    Person.all = []
  end
  
  describe "#create_person_objects" do
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


  # describe "#report_lines" do
  #   it "reports the correct number of lines from a hash" do
  #     sample_hash = {"Billy" => 4, "Jim" => 5}
  #     # expect(STDOUT).to receive(:puts).with("4 Billy\n5 Jim")
  #     expect(report_lines(sample_hash)[0]).to eq("4 Billy")
  #     expect(report_lines(sample_hash)[1]).to eq("5 Jim")
  #   end
  # end
end
