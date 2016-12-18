module ActivitiesHelper
  def link_to_activity(a)
    if a.businesses_processed?
      link_to "Find Grub", activity_url(a)
    else
      "..."
    end
  end

  def format_distance(meters)
    km = meters / 1000.0
    "#{km.round(1)}km"
  end
end
