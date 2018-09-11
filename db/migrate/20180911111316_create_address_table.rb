class CreateAddressTable < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :latitude
      t.string :longitude
    end
  end
end
