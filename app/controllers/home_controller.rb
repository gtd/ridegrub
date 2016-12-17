class HomeController < ApplicationController
  def index
    if current_user.strava_authorized?
      redirect_to activities_url
    end
  end

  def strava_token
    if params[:code]
      access_token = Strv.get_access_token(params[:code])
      if access_token
        current_user.authorize_strava(access_token)
        redirect_to activities_url
      else
        render text: "Unexpected error authorizing Strava access", status: 400
      end
    else
      render text: "Can't authorize without a code", status: 400
    end
  end
end
