class ActivitiesController < ApplicationController
  def index
    if current_user.activities.empty?
      current_user.load_recent_activities
    end

    @activities = current_user.activities
  end

  def show
    # No security for the moment
    @activity = Activity.where(id: params[:id]).first

    if ! @activity
      redirect_to activities_url
    else
      params[:point_type] ||= '1' # default to end of ride libations
      @distances = @activity.
                    distances.
                    where(point_type: params[:point_type]).
                    order('meters')
    end
  end
end
