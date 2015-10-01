require 'rails_helper'

describe "wikis/index"do
  before(:each) do
    assign(:wikis, [
      Wiki.create!(
        :title => "Title",
        :body => "MyText",
        :private => false
      ),
      Wiki.create!(
        :title => "Title",
        :body => "MyText",
        :private => false
      )
    ])
  end

  it "renders a list of wikis" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 0
    assert_select "tr>td", :text => "MyText".to_s, :count => 0
    assert_select "tr>td", :text => false.to_s, :count => 0
  end
end
