require 'rails_helper'

describe "Markdown wikis" do
	let(:user) { wiki.user }
	let!(:wiki) { create(:wiki, body: "this is
		gem in ruby
		on rails") }

	before do
		login_as(user, scope: :user)
	end

	it "View a wiki page built with Markdown" do
		
	end
end