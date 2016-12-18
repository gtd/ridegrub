module ActivitiesHelper
  def link_to_activity(a)
    if a.businesses_processed?
      link_to "Find Grub", activity_url(a)
    else
      "..."
    end
  end
end
