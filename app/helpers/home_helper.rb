module HomeHelper
  def link_to_authorize_strava
    link_to image_tag('btn_strava_connectwith_orange.png'),
            Strv.authorization_url
  end
end
