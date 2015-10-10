class UsersController < ApplicationController


  def premium_to_standard
    Wiki.private_wikis(current_user).update_all(isprivate: false)
    current_user.update_attributes(role: 'standard')
    redirect_to edit_user_registration_path
  end
  
end
