class UsersController < ApplicationController

  before_filter :authenticate_user!

  load_and_authorize_resource

  def show
 end

  def edit
  end

def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: 'The User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private

  def user_params
    params.require(:user).permit( :email, :username, :age )
  end
end