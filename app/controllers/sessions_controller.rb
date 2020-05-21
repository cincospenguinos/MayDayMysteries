class SessionsController < ApplicationController
  include SessionsHelper

  def new; end

  def create
    @user = User.where(username: params[:username]).first

    if @user && @user.authenticate(params[:password])
      login(@user)
    else
      redirect_to '/login'
    end
  end

  def destroy
    logout
  end
end
