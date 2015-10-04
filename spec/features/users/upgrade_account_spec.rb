require 'rails_helper'

describe "upgrade user" do

	let(:user) { create(:user) }

	before do
		login_as(user, scope: :user)
	end

	it "click link to upgrade" do
		visit "/wikis"
		expect(page).to have_content("Upgrade to premium account")
	end

	it "Upgrade to premium account" do
		visit "/wikis"
		click_link "Upgrade to premium account"

		click_on 'Pay with Card'
		fill_in "Card Number", with: '3566002020360505'
		fill_in	"exp-month", with: "10"
		fill_in "exp-year", with: "2015"
		fill_in "CVC", with: nil
		
		click_button "Pay $15.00"
	end

end