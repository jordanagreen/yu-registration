Given (/^I am on the home page$/) do
  visit "/"
end

Given (/^I am on the search page$/) do
  visit '/offerings/search'
end

When (/^I click "([^\"]*)"$/) do |button|
  click_button(button)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, :with => value)
end

When(/^I select "([^"]*)" for "([^"]*)"$/) do |option, from|
  page.select(option, :from => from)
end

Then (/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content text
end

Then(/^the "([^"]*)" should say "([^"]*)"$/) do |element, text|
  expect(page.find("#" + element)).to have_content text
end