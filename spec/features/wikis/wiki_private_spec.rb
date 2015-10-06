require 'rails_helper'

describe "wiki private" do

	let(:user) { create(:user) }
	let(:other_user) { create(:user, :admin) }


	it "you not see the private wiki in the wikis index for user role standard" do
		login_as(user, scope: :user)
		visit "/wikis"
		click_link "New Wiki"
		expect(page).to have_content("New Wiki")
		expect(page).to_not have_content("Private wiki")
	end

	it "you see the private wiki in the wikis index for user role standard" do
		login_as(other_user, scope: :user)
		visit "/wikis"
		click_link "New Wiki"
		expect(page).to have_content("New Wiki")
		expect(page).to have_content("Private wiki")
	end
end