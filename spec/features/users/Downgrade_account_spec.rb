require 'rails_helper'

describe "Downgrade user" do
	
	let(:user) { wiki.user }
	let!(:wiki) { create(:wiki, isprivate: true) }

	before do
		login_as(user, scope: :user)
	end

	it "Downgrade your account to standard" do 
		user.update(role: 'premium')

		visit "/users/edit"

		expect(page).to have_content("Downgrade to Standard")
		
		click_link "Downgrade to Standard"
		user.reload
		wiki.reload

		expect(user.role).to eq('standard')
		expect(wiki.isprivate).to eq(false)
	end
end