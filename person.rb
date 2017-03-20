class Person
  require 'time'

  attr_accessor :firstname, :lastname, :middleinit, :gender, :dob, :color
  @@all = []

  def initialize(attrs)
    @firstname = attrs[:firstname]
    @lastname = attrs[:lastname]
    @middleinit = attrs[:middleinit]
    @gender = attrs[:gender]
    @dob = attrs[:dob].gsub("-", "/").gsub("\n", "")
    @color = attrs[:color]
    self.fix_gender
    @@all << self
  end

  def self.all
    @@all
  end

  def convert_dob_to_datetime
    self.dob = Date.strptime(self.dob, '%m/%d/%Y')
  end

  def convert_datetime_to_dob
    date_str = self.dob.strftime("%m/%d/%Y")
    date_arr = date_str.split("/")
    date_arr[0..1].each do |n|
      if n[0] == "0"
        n[0] = ""
      end
    end
    self.dob = date_arr.join("/")
  end

  def fix_gender
    self.gender[0].downcase == "m" ? self.gender = "Male" : self.gender = "Female"
  end

  def self.sort_gender_lastname
    self.all.sort!{ |a,b| (a.gender == b.gender) ? a.lastname <=> b.lastname : a.gender <=> b.gender }
  end

  def self.sort_dob_lastname
    self.all.each { |p| p.convert_dob_to_datetime }
    self.all.sort!{ |a,b| (a.dob == b.dob) ? a.lastname <=> b.lastname : a.dob <=> b.dob }
    self.all.each { |p| p.convert_datetime_to_dob}
  end

  def self.sort_lastname_desc
    self.all.sort_by!{ |person| person.lastname}.reverse!
  end

  #for use in tests
  def self.all=(array)
    @@all = array
  end

end
