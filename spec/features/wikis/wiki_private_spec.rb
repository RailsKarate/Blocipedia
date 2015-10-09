require 'rails_helper'

describe "wiki private" do

	let(:user) { create(:user) }
	let(:other_user) { create(:user, :premium) }


	it "you not see the private wiki in the wikis index for user role standard" do
		login_as(user, scope: :user)
		visit "/wikis"
		expect(page).to_not have_content("Private Wiki")
		expect(page).to have_content("Public Wiki")
	end

	it "you see the private wiki in the wikis index for user role standard" do
		login_as(other_user, scope: :user)
		visit "/wikis"
		expect(page).to have_content("Private Wiki")	
		expect(page).to have_content("Public Wiki")	
	end
end