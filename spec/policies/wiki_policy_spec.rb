require 'rails_helper'

describe "Wiki Policy" do
	 subject { WikiPolicy }

	 let(:user){ create(:user) }
	 let(:other_user){ create(:user) }
	 let(:wiki) { create(:wiki, user: other_user) }
	 

  permissions :update? do
	    it "should allow a other_user to update" do
	      	expect(subject).to permit(other_user, wiki)
    	end
	end
end