class CreateCrimesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :crimes do |t|
      t.string :category
      t.string :latitude
      t.string :longitude
      t.string :street_name
      t.string :outcome_status
      t.integer :crime_id
      t.string :month
      t.references :area, foreign_key: true
    end
  end
end
