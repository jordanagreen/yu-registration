class Course < ActiveRecord::Base
    has_many :offerings, inverse_of: :course
    validates_associated :offerings
    
     def self.search_offerings(search)
        # search by department name, instructor, course number, and semester
        department = search[:department] || ''
        instructor = search[:instructor] || ''
        course_number = search[:course_number] || ''
        semester = search[:semester] || '_'
        joins(:offerings).where("department LIKE (?) AND course_number LIKE (?)
            AND offerings.professor_last_name LIKE (?) AND offerings.semester LIKE ?", 
            "%#{department}%", "%#{course_number}%", "%#{instructor}%", semester)
     end
end
