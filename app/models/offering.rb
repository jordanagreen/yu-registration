class Offering < ActiveRecord::Base
    enum semester: [:Fall, :Spring, :Summer]
    belongs_to :course, inverse_of: :offerings
    validates :crn, uniqueness: true
    
    def enroll
        if (self.spots_available > 0) then 
            self.decrement! :spots_available, 1
            return true
        end
        return false
    end
    
    def self.search(params)
        # search by department name, instructor, course number, and semester
        department = params[:department] || ''
        instructor = params[:instructor] || ''
        course_number = params[:course_number] || ''
        semester = params[:semester] || ''
        if semester == ''
            joins(:course).where("courses.department ILIKE (?) AND courses.course_number ILIKE (?)
                AND professor_last_name ILIKE (?)", 
                "%#{department}%", "%#{course_number}%", "%#{instructor}%").order(:crn)
        else
            joins(:course).where("courses.department ILIKE (?) AND courses.course_number ILIKE (?)
                AND professor_last_name ILIKE (?) AND semester = (?)", 
                "%#{department}%", "%#{course_number}%", "%#{instructor}%", semester.to_i).order(:crn)
        end
    end
end
