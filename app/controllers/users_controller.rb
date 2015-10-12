class UsersController < ApplicationController
	
  def downgrade_account
    current_user.update_attribute(:role, 'standard')
    
    current_user.wikis.each do |wiki|
      wiki.update_attribute(:isprivate, false)
    end
    redirect_to wikis_path
  end 
  
end
