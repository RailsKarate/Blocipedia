require 'rails_helper'

describe "Signing up" do
	it "allows a user to sign up for the site and creates the object in the database" do
		expect(User.count).to eq(0)

		visit "/users/sign_up"

		fill_in "First name", with: "Pedro"
		fill_in "Email", with: "drope@gmail.com"
		fill_in "Password", with: "pedro30365"
		fill_in "Password confirmation", with: "pedro30365"
		click_button "Sign up"

		expect(User.count).to eq(1)
	end
end