require 'rails_helper'

RSpec.describe Wiki, type: :model do

 	context "relationships" do
		it {should belong_to (:user)}
	end
end
