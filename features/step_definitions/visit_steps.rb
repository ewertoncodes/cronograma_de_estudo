Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_text(text)
end

When(/^I go to the activity create$/) do
  visit new_activity_path
end

When(/^I go to the activity index$/) do
  visit activities_path
end