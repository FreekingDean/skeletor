class SessionsController < ApplicationController
  include Authenticator

  def create
    login(username: params[:username], password: params[:password])

    if current_account.blank?
      redirect_to new_session_path
    else
      redirect_to current_account
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
