require 'spec_helper'

describe "wishes/show" do
  before(:each) do
    @wish = assign(:wish, stub_model(Wish,
      :user_id => 1,
      :thing_id => 2,
      :description => "Description",
      :story => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Description/)
    rendered.should match(/MyText/)
  end
end
