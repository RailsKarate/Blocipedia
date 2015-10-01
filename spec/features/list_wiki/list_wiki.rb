require 'rails_helper'

describe "List wikis" do

	let(:user) { create(:user) }

	before do
		login_as(user, scope: :user)
	end

	it "listing the wikis to user and Edit his Wikis" do
		visit "/wikis"
		click_link "List Wikis User"
		expect(page).to have_content("List Wikis User")
		expect(page).to have_content("Edit")
	end
end