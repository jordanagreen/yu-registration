require 'rails_helper'

RSpec.describe Offering, type: :model do
 
  before :each do 
     @c = Course.create(department: "COM", course_number: "1000", title: "Intro") 
     @o = Offering.create(course: @c, semester: 1, location: "Belfer 400",
        section: 321, professor_last_name: "Kelly", spots_available: 10, crn: 5000)
  end
  
  it "is valid with a semester, location, section, crn, professor, spots, and course" do
    expect(@o).to be_valid
  end
  
  it 'reduces available spots by 1 when enrolling' do
      @o.enroll
      expect(@o.spots_available).to eql 9
  end
  
  it 'does not reduce available spots when already 0' do
      @o.spots_available = 0
      @o.enroll
      expect(@o.spots_available).to eql 0
  end
end
