require 'rails_helper'

describe "Deleting wikis" do
	let(:user) { create(:user, :admin) }
	let!(:wiki) { create(:wiki) }

	before do
		login_as(user, scope: :user)
	end

	it "is success when clicking the destroy link" do
		visit "/wikis"

		click_link wiki.title, wiki	
		expect(page).to have_content(wiki.title)
		
		click_link "Delete"
		expect(Wiki.count).to eq(0)
		
	end
end