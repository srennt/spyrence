class UsersControler < ApplicationController

  authenticate_user!

  load_and_authorize_resource

  def show
 end

  def edit
  end

  def update
    @user.update_attributes(user_params)
  end

  private

  def user_params
    require(:user)
  end
end