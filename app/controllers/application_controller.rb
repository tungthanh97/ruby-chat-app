# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user, :isLoggedIn?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def isLoggedIn?
    !!current_user
  end

  def require_user
    unless isLoggedIn?
      flash[:alert] = 'You are not logged in'
      redirect_to login_path
    end
  end
end
