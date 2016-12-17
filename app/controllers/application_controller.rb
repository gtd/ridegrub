class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :load_user

  # Poor-mans user account for demo purposes, it just lives as long as your
  # session does, and guarantees we always have a user.
  def load_user
    if session[:user_id]
      @current_user = User.where(id: session[:user_id]).first
    end

    if !@current_user
      @current_user = User.create
      session[:user_id] = @current_user.id
    end
  end

  def current_user
    @current_user
  end
end
