Feature: Enroll in Offerings
  As a student
  I want to enroll in offerings
  So that I can take the courses
  
Scenario: I enroll in a course
  Given I am on the search page
  When I fill in "course_number" with "1300C"
  And I select "Fall" for "semester"
  And I click "Search"
  And I click "Enroll"
  Then the "notice" should say "You have been enrolled in Introduction to Computer Science."
  
Scenario: I enroll in a full course
  Given I am on the search page
  When I fill in "course_number" with "1300C"
  And I select "Spring" for "semester"
  And I click "Search"
  And I click "Enroll"
  Then the "alert" should say "Introduction to Computer Science is already full."