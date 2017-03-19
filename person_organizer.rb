require_relative 'person'
require 'pry'

file1 = File.readlines("file1.txt")
file2 = File.readlines("file2.txt")
file3 = File.readlines("file3.txt")

def create_person_objects(file)
  file.each do |line|
    if line.include?(",")
      attrs = line.split(", ")
      Person.new(comma_attrs(attrs))
    elsif line.include?("|")
      attrs = line.split(" | ")
      Person.new(pipe_attrs(attrs))
    else
      attrs = line.split(" ")
      Person.new(space_attrs(attrs))
    end
  end
end

def comma_attrs(array)
  {lastname: array[0], firstname: array[1], middleinit: nil, gender: array[2], dob: array[4], color: array[3]}
end
def pipe_attrs(array)
  {lastname: array[0], firstname: array[1], middleinit: array[2], gender: array[3], dob: array[5], color: array[4]}
end
def space_attrs(array)
  {lastname: array[0], firstname: array[1], middleinit: array[2], gender: array[3], dob: array[4], color: array[5]}
end


def output_1
  Person.sort_gender_lastname
  puts "Output 1:"
  output_people
  puts "\n"
end

def output_2
  Person.sort_dob_lastname
  puts "Output 2:"
  output_people
  puts "\n"
end

def output_3
  Person.sort_lastname_desc
  puts "Output 3:"
  output_people
  puts "\n"
end

def output_people
  Person.all.each do |p|
    puts "#{p.lastname} #{p.firstname} #{p.gender} #{p.dob} #{p.color}"
  end
end

create_person_objects(file1)
create_person_objects(file2)
create_person_objects(file3)

# Person.date_to_slashes

output_1
output_2
output_3
