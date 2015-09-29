require 'rails_helper'

describe "creating wiki" do
	let(:user) { create(:user) }

	def create_wiki(options={})
		options[:title] ||= "My Wiki"
		options[:description] ||= "This is my wiki."
		options[:private] ||= false
		
		visit "/wikis"
		click_link "New Wiki"
		expect(page).to have_content("New Wiki")

		fill_in "Title", with: options[:title]
		fill_in "Body", with: options[:body]

		click_button "Create Wiki"
	end

	before do
		login_as(user, :scope => :user)
	end

	it "redirects to the wiki index page on success" do
		create_wiki title: "Grocery wiki", body: "This is my wiki"
		expect(page).to have_content("Grocery wiki")
	end

	it "displays an error when the wiki has no title" do
		expect(Wiki.count).to eq(1)
		
		create_wiki title: ""
		expect(page).to have_content("error")
		expect(Wiki.count).to eq(1)

		visit "/wikis"
		expect(page).to_not have_content("This is what I am doing today.")
	end

	it "displays an error when the wiki has title less than 4 characters" do
		expect(Wiki.count).to eq(1)
		
		create_wiki title: "hi"

		expect(page).to have_content("error")
		expect(Wiki.count).to eq(1)

		visit "/wikis"
		expect(page).to_not have_content("This is what I am doing today.")
	end

	it "displays an error when the wiki has no Body" do
		expect(Wiki.count).to eq(1)
		
		create_wiki title: "Grocery wiki", body: ""

		expect(page).to have_content("error")
		expect(Wiki.count).to eq(1)

		visit "/wikis"
		expect(page).to_not have_content("Grocery wiki")
	end

	it "displays an error when the wiki has Body less than 6 characters" do
		expect(Wiki.count).to eq(1)
		
		create_wiki title: "Grocery wiki", body: "food"

		expect(page).to have_content("error")
		expect(Wiki.count).to eq(1)

		visit "/wikis"
		expect(page).to_not have_content("Grocery wiki")
	end
end