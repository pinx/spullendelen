require 'spec_helper'

describe "wishes/edit" do
  before(:each) do
    @wish = assign(:wish, stub_model(Wish,
      :user_id => 1,
      :thing_id => 1,
      :description => "MyString",
      :story => "MyText"
    ))
  end

  it "renders the edit wish form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wish_path(@wish), "post" do
      assert_select "input#wish_user_id[name=?]", "wish[user_id]"
      assert_select "input#wish_thing_id[name=?]", "wish[thing_id]"
      assert_select "input#wish_description[name=?]", "wish[description]"
      assert_select "textarea#wish_story[name=?]", "wish[story]"
    end
  end
end
