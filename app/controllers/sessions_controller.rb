class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_oauth(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
