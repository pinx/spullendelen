module MemberSessionHelper
  def current_member
    @current_member
  end

  def login(member=nil)
    if member.nil?
      @current_member = FactoryGirl.create(:member, membername: fake_name)
    else
      @current_member = member
    end
    visit login_path
    fill_in 'Username', with: @current_member.name
    fill_in 'Password', with: '1234'
    click_button 'Login'
    #page.should have_content('Logout')
  end

  def logout
    click_link 'Logout'
  end
end