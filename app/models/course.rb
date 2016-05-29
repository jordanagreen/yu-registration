class Course < ActiveRecord::Base
    has_many :offerings, inverse_of: :course
    validates :department, :course_number, :title, presence: true
    validates_associated :offerings
end
