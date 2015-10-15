class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@wikis = @user.wikis.public_wikis(@user)
		@private_wikis = Wiki.private_wikis(@user)
		@collaborated_wikis = @user.collaborated_wikis
  	end

  	def update
  	end
		
	def downgrade_account
		current_user.update_attribute(:role, 'standard')

		current_user.wikis.each do |wiki|
		  wiki.update_attribute(:isprivate, false)
		end
		redirect_to wikis_path
	end 
  
end
