class ActivitiesController < ApplicationController
  def index
    if current_user.activities.empty?
      current_user.load_recent_activities
    end

    @activities = current_user.activities
  end

  def show
  end
end
