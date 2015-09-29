require 'rails_helper'
describe "User Role" do
	let(:user) { create(:user, :user) }
	let(:other_user) { create(:user, :admin)}

	it "add to user role user" do
		login_as(user, scope: :user)
		visit "/wikis"
		expect(page).to have_content(user.email)
	end
end