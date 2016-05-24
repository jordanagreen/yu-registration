class Offering < ActiveRecord::Base
    enum semester: [:fall, :spring, :summer]
    belongs_to :course, inverse_of: :offerings
    validates :crn, uniqueness: true
end
