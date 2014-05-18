Given(/^I am signed in$/) do
  @member = create :member
  login_as @member
end

Given(/^I am not signed in$/) do
  logout
  @member = nil
end

