module ActivitiesHelper
  def link_to_activity(a)
    if a.businesses_processed?
      link_to "Find Grub", show_activity_url(a)
    else
      "Processing..."
    end
  end
end
