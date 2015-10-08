class UsersController < ApplicationController


  def downgrade_account
    Wiki.private_wikis(current_user).update_all(private: false)
    current_user.update_attributes(role: 'standard')
    redirect_to edit_user_registration_path
  end
end
