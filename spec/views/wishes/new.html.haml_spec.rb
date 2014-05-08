require 'spec_helper'

describe "wishes/new" do
  before(:each) do
    assign(:wish, stub_model(Wish,
      :user_id => 1,
      :thing_id => 1,
      :description => "MyString",
      :story => "MyText"
    ).as_new_record)
  end

  it "renders new wish form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wishes_path, "post" do
      assert_select "input#wish_user_id[name=?]", "wish[user_id]"
      assert_select "input#wish_thing_id[name=?]", "wish[thing_id]"
      assert_select "input#wish_description[name=?]", "wish[description]"
      assert_select "textarea#wish_story[name=?]", "wish[story]"
    end
  end
end
