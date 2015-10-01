require 'rails_helper'

describe "Wiki Policy" do
	 subject { WikiPolicy }

	 let(:user){ create(:user) }
	 
	 let(:wiki) { create(:wiki, user: user) }
	

  	permissions :update? do
	    it "should allow a user to update" do
	      	expect(subject).to permit(user, wiki)	      	
    	end
	end
end