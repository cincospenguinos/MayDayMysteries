class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to documents_url
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password)
  end
end
