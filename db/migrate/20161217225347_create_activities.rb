class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.integer :strava_id
      t.string :name
      t.datetime :start_date
      t.string :timezone
      t.float :start_lat
      t.float :start_long
      t.float :end_lat
      t.float :end_long
      t.text :raw
      t.boolean :businesses_processed

      t.timestamps

      t.index :strava_id
    end
  end
end
