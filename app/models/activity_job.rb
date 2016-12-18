class ActivityJob
  @queue = :main

   def self.perform(activity_id)
     activity = Activity.where(id: activity_id).first

     if activity
       activity.load_businesses
     end
   end
end
