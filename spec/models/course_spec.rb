require 'rails_helper'

RSpec.describe Course, type: :model do
  it "is valid with a department, number, and title" do
      c = Course.create(department: "COM", course_number: "1000", title: "Intro")
      expect(c).to be_valid
  end
end
