require 'rails_helper'

describe User do
	let(:valid_attributes){
 		{
 			email: "drope@gmail.com",
 			encrypted_password: "pedro30365",
 			reset_password_token: "pedro30365"
 		}
 	}
 	
 	context "validations" do
 		let(:user) {User.new(valid_attributes)}

 		before do
 			User.create(valid_attributes)
 		end

 		it "requires an email" do
 			expect(user).to validate_presence_of(:email)
 		end

 		it "requires a unique email" do
 			expect(user).to validate_uniqueness_of(:email)
 		end

 		it "requires a unique email (case insensitive)" do
 			user.email = "DROPE@GMAIL.COM"
 			expect(user).to validate_uniqueness_of(:email)
 		end

 		it "requires the email address to look like an email" do
 			user.email = "pedro"
 			expect(user).to_not be_valid
 		end
 		
 	end
end
