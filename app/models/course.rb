class Course < ActiveRecord::Base
    has_many :offerings, inverse_of: :course
    validates_associated :offerings
end
