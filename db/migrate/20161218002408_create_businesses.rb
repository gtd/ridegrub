class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :yelp_id
      t.string :name
      t.string :url
      t.string :display_phone
      t.float :rating
      t.text :display_address
      t.float :latitude
      t.float :longitude
      t.text :raw

      t.timestamps

      t.index :yelp_id, unique: true
    end
  end
end
