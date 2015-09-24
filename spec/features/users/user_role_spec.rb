require 'rails_helper'
describe "user with to role" do
	let(:user) { create(:user) }

	before do
		login_as(user, :scope => :user)
	end

end