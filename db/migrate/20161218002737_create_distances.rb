class CreateDistances < ActiveRecord::Migration[5.0]
  def change
    create_table :distances do |t|
      t.references :business, foreign_key: true
      t.references :activity, foreign_key: true
      t.integer :meters
      t.integer :point_type
      t.boolean :close_to_point

      t.timestamps
    end
  end
end
