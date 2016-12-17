class HomeController < ApplicationController
  def index
    render text: current_user.id
  end
end
