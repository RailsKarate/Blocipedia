require 'rails_helper'

RSpec.describe "wikis/edit", type: :view do
  before(:each) do
    @wiki = assign(:wiki, Wiki.create!(
      :title => "MyString",
      :body => "MyText",
      :private => false
    ))
  end

  it "renders the edit wiki form" do
    render

    assert_select "form[action=?][method=?]", wiki_path(@wiki), "post" do

      assert_select "input#wiki_title[name=?]", "wiki[title]"

      assert_select "textarea#wiki_body[name=?]", "wiki[body]"

      assert_select "input#wiki_private[name=?]", "wiki[private]"
    end
  end
end
