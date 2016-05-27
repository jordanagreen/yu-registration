class Offering < ActiveRecord::Base
    enum semester: [:Fall, :Spring, :Summer]
    belongs_to :course, inverse_of: :offerings
    validates :crn, uniqueness: true
    
    def enroll
        if (self.spots_available > 0) then 
            self.decrement! :spots_available, 1
        end
    end
    
    def self.search(params)
        # search by department name, instructor, course number, and semester
        department = params[:department] || ''
        instructor = params[:instructor] || ''
        course_number = params[:course_number] || ''
        semester = params[:semester] || '_'
        if (semester.strip == '') then
            semester = '_'
        end
        joins(:course).where("courses.department LIKE (?) AND courses.course_number LIKE (?)
            AND professor_last_name LIKE (?) AND semester LIKE ?", 
            "%#{department}%", "%#{course_number}%", "%#{instructor}%", semester)
    end
end
