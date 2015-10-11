require 'rails_helper'

describe "wiki private" do
	let(:user) { wiki.user}

	let!(:wiki) {create(:wiki, isprivate: true)}
	let!(:other_wiki) {create(:wiki, title: "this wiki")}


	it "you not see the private wiki in the wikis index for user role standard" do
		login_as(user, scope: :user)

		visit "/wikis"
		expect(Wiki.count).to eq(2)

		within "table" do
			expect(page).to_not have_content(wiki.title)
			expect(page).to have_content(other_wiki.title)
		end
	end	
end