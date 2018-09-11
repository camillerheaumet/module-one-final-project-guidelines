class CreateAreasTable < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
      t.string :address
      t.string :latitude
      t.string :longitude
    end
  end
end
