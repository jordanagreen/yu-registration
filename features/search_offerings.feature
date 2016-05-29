Feature: Search Offerings
  As a user
  I want to be able to search offerings
  So that I can quickly find the offerings I want
  
Scenario: I search for all offerings
  Given I am on the search page
  When I click "Search"
  Then I should see "Listing Offerings"
  
Scenario: I search for COM offerings
  Given I am on the search page
  When I fill in "department" with "COM"
  And I click "Search"
  Then I should see "Introduction to Computer Science"