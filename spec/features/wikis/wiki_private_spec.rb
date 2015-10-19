require 'rails_helper'

describe "wiki private" do
	let(:user) { wiki.user}	
	let(:other_user){ create(:user)}

	let!(:wiki) {create(:wiki, isprivate: true)}
	let!(:other_wiki) {create(:wiki, title: "this wiki")}


	it "you not see the private wiki in the wikis index for user role standard" do
		login_as(user, scope: :user)
		user.update(role: 'premium')

		login_as(other_user, scope: :user)

		visit "/wikis"
		expect(Wiki.count).to eq(2)

		
			expect(page).to_not have_content(wiki.title)
			expect(page).to have_content(other_wiki.title)
		
	end	

	it "you see the private wiki and public in the wikis index for user role premium" do
		login_as(user, scope: :user)
		user.update(role: 'premium')

		visit "/wikis"
		expect(Wiki.count).to eq(2)

			expect(page).to have_content(wiki.title)
			expect(page).to have_content(other_wiki.title)
	
	end	
end