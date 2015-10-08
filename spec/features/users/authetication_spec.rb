require 'rails_helper'

describe "Logging In" do

	it "logs the user in and goes to the wikis" do
		User.create(first_name: "Pedro", email: "pedro@gmail.com", password: "pedro12345", password_confirmation: "pedro12345")
		visit new_user_session_path
		fill_in "Email", with: "pedro@gmail.com"
    	fill_in "Password", with: "pedro12345"
    	click_button "Log in"
	end

	it "diplays the email address in the event of a failed login" do
	    visit new_user_session_path
	    fill_in "Email", with: "pedro@gmail.com"
	    fill_in "Password", with: "incorrect"
	    click_button "Log in"

	    expect(page).to have_content("")
	    expect(page).to have_field("Email", with: "pedro@gmail.com")
  	end
end