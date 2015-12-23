class UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def downgrade 
    current_user.update_attribute(:role, 'standard')

    redirect_to edit_user_registration_path
  end

end
