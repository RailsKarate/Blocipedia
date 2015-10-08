require 'rails_helper'

describe "Deleting wikis" do
	let(:user) { wiki.user }
	let!(:wiki) { create(:wiki) }

	before do
		login_as(wiki.user, scope: :user)
	end

	it "is success when clicking the destroy link" do
		visit "/wikis"

		click_link wiki.title, wiki
		click_link "Edit"

		expect(page).to_not have_content(wiki.title)
		expect(Wiki.count).to eq(1)
	end
end