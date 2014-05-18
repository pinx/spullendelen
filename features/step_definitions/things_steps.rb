
And(/^there are things$/) do
  if !@member
    @member = create :member
  end
  @member.things = create_list :thing, 2
  create :thing
end


When(/^I go to the things list$/) do
  visit things_path
end


Then(/^I should see things$/) do
  expect(page).to have_css('table tr.thing_decorator', count: 3)
end


When(/^I go to my things$/) do
  visit my_things_path
end


Then(/^I should see my things$/) do
  expect(page).to have_css('table tr.thing_decorator', count: 2)
  end


And(/^I should not see owners$/) do
  expect(page).to_not have_css('.member_name')
end