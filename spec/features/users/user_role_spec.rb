require 'rails_helper'

describe "User Role" do
	

	it "add to user role user" do
		user = create(:user, :admin)
		login_as(user, scope: :user)
		visit "/wikis"
		expect(page).to have_content(user.email)
	end

	it "User standard can edit all wikis" do
		user = create(:user, :standard)
		login_as(user, scope: :user)

		wiki = create(:wiki)

		visit "/wikis"
		expect(page).to have_content(user.email)

		click_link wiki.title, wiki
		click_link "Edit"
	end
end