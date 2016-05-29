require 'rails_helper'

RSpec.describe Offering, type: :model do
  it "is valid with a semester, location, section, crn, professor, spots, and course" do
     c = Course.create(department: "COM", course_number: "1000", title: "Intro") 
     o = Offering.create(course: c, semester: 1, location: "Belfer 400",
        section: 321, professor_last_name: "Kelly", spots_available: 10, crn: 5000)
    expect(o).to be_valid
  end
end
