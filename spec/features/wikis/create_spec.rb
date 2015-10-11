require 'rails_helper'

describe "creating wiki" do
	let(:user) { create(:user) }

	def create_wiki(options={})
		options[:title] ||= "My Wiki"
		options[:body] ||= "This is my wiki."
		options[:isprivate] ||= false		

		visit "/wikis"
		click_link "Create A New Wiki"
		expect(page).to have_content("Create A New Wiki")

		fill_in "Title", with: options[:title]
		fill_in "Body", with: options[:body]

		click_button "Save"
	end

	before do
		login_as(user, scope: :user)
	end

	it "redirects to the wiki index page on success" do
		create_wiki title: "Grocery wiki", body: "This is my wiki"
		expect(page).to have_content("Grocery wiki")
	end

	it "displays an error when the wiki has no title" do
		expect(Wiki.count).to eq(0)
		
		create_wiki title: ""
		expect(Wiki.count).to eq(0)

		visit "/wikis"
		expect(page).to_not have_content("This is what I am doing today.")
	end

	it "displays an error when the wiki has title less than 4 characters" do
		expect(Wiki.count).to eq(0)
		
		create_wiki title: "hi"

		expect(Wiki.count).to eq(0)

		visit "/wikis"
		expect(page).to_not have_content("This is what I am doing today.")
	end

	it "displays an error when the wiki has no Body" do
		expect(Wiki.count).to eq(0)
		
		create_wiki title: "Grocery wiki", body: ""

		expect(Wiki.count).to eq(0)

		visit "/wikis"
		expect(page).to_not have_content("Grocery wiki")
	end

	it "displays an error when the wiki has Body less than 6 characters" do
		expect(Wiki.count).to eq(0)
		
		create_wiki title: "Grocery wiki", body: "food"

		expect(Wiki.count).to eq(0)

		visit "/wikis"
		expect(page).to_not have_content("Grocery wiki")
	end
end