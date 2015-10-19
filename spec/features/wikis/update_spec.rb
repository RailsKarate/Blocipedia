require 'rails_helper'

describe "Updating wikis" do
	let(:user) { wiki.user }
	let!(:wiki) { create(:wiki) }

	def update_wiki(options={})
		options[:title] ||= "My wiki"
		options[:body] ||= "This is my wiki."

		wiki = options[:wiki]

		visit "/wikis"

		click_link wiki.title, wiki

		click_link "Edit Wiki"

		fill_in "Title", with: options[:title]
		fill_in "Body", with: options[:body]
		click_button "Save"
	end

	before do
		login_as(wiki.user, scope: :user)
	end

	it "updates a wiki successfully with correct information" do
		update_wiki wiki: wiki, 
						title: "New title", 
						body: "New body"


		wiki.reload

		expect(page).to have_content("Wiki was successfully updated.")
		expect(wiki.title).to eq("New title")
		expect(wiki.body).to eq("New body")
 	end

 	it "displays an error with no title" do
	 	update_wiki wiki: wiki, title: ""
	 	title = wiki.title
	 	wiki.reload
	 	expect(wiki.title).to eq(title)
	 	expect(page).to have_content("error")
 	end

 	it "displays an error with too short a title" do
	 	update_wiki wiki: wiki, title: "hi"
	 	expect(page).to have_content("error")
 	end

 	it "displays an error with no body" do
	 	update_wiki wiki: wiki, body: ""
	 	expect(page).to have_content("error")
 	end

 	it "displays an error with too short a body" do
	 	update_wiki wiki: wiki, body: "gg"
	 	expect(page).to have_content("error")
 	end
end