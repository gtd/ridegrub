class RemoveUniquenessOnActivityIds < ActiveRecord::Migration[5.0]
  def change
    remove_index :activities, :strava_id # Remove unique so we can test against multiple users
    add_index :activities, :strava_id
  end
end
