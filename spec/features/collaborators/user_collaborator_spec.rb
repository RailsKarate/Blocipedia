require 'rails_helper'

describe "Collaborators user" do

	let(:other_user){ create(:user)}
	let(:user) { wiki.user }
	let!(:wiki) { create(:wiki, isprivate: true) }

	def add_standard_collaborator 
		login_as(other_user, scope: :user)
		login_as(user, scope: :user)
		user.update(role: 'premium')

		visit "/wikis"

		click_link wiki.title, wiki	
		expect(page).to have_content("Add/Delete Collaborator")
		click_link "Add/Delete Collaborator"
		
		within "#user_2" do
			click_button "Add Collaborator"
		end
	end

	def remove_standard_collaborator
		add_standard_collaborator

		click_link "Add/Delete Collaborator"

		within "#user_2" do
			click_button "Remove Collaborator"
		end

	end

	it "you can't add the user multiple times" do
		add_standard_collaborator

		click_link "Add/Delete Collaborator"

		within "#user_2" do
			expect(page).to_not have_button "Add Collaborator"
		end

	end

	it "you can see the private wiki in the wikis index" do
		add_standard_collaborator

		login_as(other_user, scope: :user)
		visit "/wikis"

		expect(page).to have_content(wiki.title)
	end

	it "you can edit the private wiki" do
		add_standard_collaborator

		login_as(other_user, scope: :user)
		visit "/wikis"

		click_link wiki.title, wiki	
		click_link "Edit Wiki"
						
		wiki.update(title: "New title", 
					body: "New body")

		wiki.reload

		expect(wiki.title).to eq("New title")
		expect(wiki.body).to eq("New body")
	end

	it "remove a collaborator from a private wiki and you can't see the private wiki in the wikis index" do
		remove_standard_collaborator

		login_as(other_user, scope: :user)
		visit "/wikis"

		expect(page).to_not have_content(wiki.title)	
	end

	it "you can't edit the private wiki" do
		remove_standard_collaborator

		login_as(other_user, scope: :user)
		visit "/wikis"

		expect(page).to_not have_link wiki.title
		expect(page).to_not have_link "Edit Wiki"
		
	end

end