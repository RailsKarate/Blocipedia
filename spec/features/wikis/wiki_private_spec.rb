require 'rails_helper'

describe "wiki private" do

		let!(:wiki) {create(:wiki)}
		let!(:other_wiki){create(:wiki, private: true)}
	
	it "you not see the private wiki in the wikis index for user role standard" do
		other_user = create(:user)
		login_as(other_user, scope: :user)
		visit "/wikis"

		within "table" do
			expect(page).to have_content(wiki.title)
			expect(page).to have_content(other_wiki.title)
		end
	end

	it "you see the private wiki in the wikis index for user role standard" do
		
		user = create(:user, :premium)
		login_as(user, scope: :user)
		visit "/wikis"
		
		
	end
	
end