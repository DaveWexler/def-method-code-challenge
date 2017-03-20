### Code Challenge - Def Method

### David Wexler

Thank you very much for the opportunity to do this code challenge! It proved to be very interesting, with lots of little minutiae keeping me on my toes. In the end, I had a fun time working on the assignment.

#### Contents

1. person_organizer.rb -- The main script file.
2. file1.txt, file2.txt, file3.txt -- These are txt files I made by copying and pasting the sample files online. I at first tried to capture the text programmatically via the uri, but the embedded code and the google doc format made this rather unwieldy, to say the least. I hope it's okay I took this shortcut!
3. person.rb -- the class for a Person object, including its instance and class methods as well as a store for created People (@@all).
4. person_organizer_spec.rb -- the test file for person_organizer.rb, to be run with rspec
5. person_spec.rb -- the test file for the Person model, also to be run with rspec

All files should be located in the same directory.

#### To Run the script

To run the script, simply type "ruby person_organizer.rb" into the command line while in the directory with all files in it. The required output for the assignment should be printed to the terminal.

To run the tests, use rspec by entering "rspec person_organizer_spec.rb" or "rspec person_spec.rb" into the command line. The test results will be printed to the terminal.

#### A note about d.o.b.

I was considering converting all dob's to Datetime objects upon creation of a person object. If persisted this way, more sorting options are open for hypothetical future changes to the desired project. But, given the constraints of the code challenge itself, I decided to save dob as a string and convert it to a Datetime object only for the output that needed to sort by that criteria. This way, for the outputs that don't require sorting by dob, no conversion was needed.

There is certainly an argument to be made that this is not the optimal conception of the solution to this problem. I could certainly have done it the other way, but I made the judgment call to keep the dob structure as is. Just wanted to point this out. :)

#### Thanks again!
