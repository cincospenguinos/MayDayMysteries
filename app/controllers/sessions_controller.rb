class SessionsController < ApplicationController
  include SessionsHelper

  def new; end

  def create
    @user = User.where(username: params[:username]).first

    if @user&.authenticate(params[:password])
      login(@user)
      redirect_to documents_url
    else
      redirect_to '/login'
    end
  end

  def destroy
    logout
  end
end
