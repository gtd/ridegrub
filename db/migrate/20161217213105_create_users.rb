class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :strava_access_token

      t.timestamps
    end
  end
end
