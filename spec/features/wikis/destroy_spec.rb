require 'rails_helper'

describe "Deleting wikis" do
	let(:user) { wiki.user }
	let!(:wiki) { create(:wiki) }

	before do
		login_as(wiki.user, :scope => :user)
	end

	it "is success when clicking the destroy link" do
		visit "/wikis"
		click_link "List Wikis User"
		within "#wiki_#{wiki.id}" do
			click_link "Destroy"
		end
		expect(page).to_not have_content(wiki.title)
		expect(Wiki.count).to eq(1)
	end
end