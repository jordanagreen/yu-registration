class Offering < ActiveRecord::Base
    enum semester: [:fall, :spring, :summer]
    belongs_to :course
end
