require_relative 'person_organizer'
require_relative 'person'

describe "Person" do
  before(:each) do
    Person.all = []
    file = ["Berry, Chuck, Male, Blue, 10/18/1926",
      "Diddley, Bo, Male, Red, 2/13/1925",
      "Franklin, Aretha, Female, Green, 2/13/1925",
      "Ross, Diana, Female, Silver, 5/3/1933"]
    create_person_objects(file)
  end

  describe "#convert_dob_to_datetime" do
    it "successfully converts a Person's m/d/y dob string to a datetime format" do
      Person.all.first.convert_dob_to_datetime
      expect(Person.all.first.dob.to_s).to eq("1926-10-18")
    end
  end

  describe "#convert_datetime_to_dob" do
    p = Person.all.first
    p.dob = Date.strptime("{ 1999, 02, 18 }", "{ %Y, %m, %d }")
    p.convert_datetime_to_dob

    it "successfully converts a Person's DOB as a datetime object to m/d/y string" do
      expect(p.dob).to eq("2/18/1999")
    end

    it "strips zero from the front of m/d" do
      expect(p.dob[0]).to eq("2")
    end
  end

  describe "#sort_gender_lastname" do
    it "sorts People by gender first, last name second" do
      Person.sort_gender_lastname
      expect(Person.all.first.firstname).to eq("Aretha")
      expect(Person.all[1].firstname).to eq("Diana")
      expect(Person.all[2].firstname).to eq("Chuck")
      expect(Person.all.last.firstname).to eq("Bo")
    end
  end

  describe "#sort_dob_lastname" do
    it "sorts People by dob first, lastname second" do
      Person.sort_dob_lastname
      expect(Person.all.first.firstname).to eq("Bo")
      expect(Person.all[1].firstname).to eq("Aretha")
      expect(Person.all[2].firstname).to eq("Chuck")
      expect(Person.all.last.firstname).to eq("Diana")
    end
  end

  describe "#sort_lastname_desc" do
    it "sorts People by last name descending" do
      Person.sort_lastname_desc
      expect(Person.all.first.firstname).to eq("Diana")
      expect(Person.all[1].firstname).to eq("Aretha")
      expect(Person.all[2].firstname).to eq("Bo")
      expect(Person.all.last.firstname).to eq("Chuck")
    end
  end
end
