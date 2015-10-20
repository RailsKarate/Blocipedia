require 'rails_helper'

describe "User Role" do
	

	it "add to user role user" do
		user = create(:user, :admin)
		login_as(user, scope: :user)
		visit "/wikis"
		expect(page).to have_content(user.first_name)
	end

	it "User standard can edit all wikis" do
		user = create(:user)
		login_as(user, scope: :user)

		wiki = create(:wiki)

		visit "/wikis"
		expect(page).to have_content(user.first_name)

		click_link wiki.title, wiki
		click_link "Edit Wiki"
	end
end