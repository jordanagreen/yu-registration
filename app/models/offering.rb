class Offering < ActiveRecord::Base
    enum semester: [:fall, :spring, :summer]
    belongs_to :course, inverse_of: :offerings
    validates :crn, uniqueness: true
    
    def enroll
        if (self.spots_available > 0) then 
            self.decrement! :spots_available, 1
        end
    end
end
