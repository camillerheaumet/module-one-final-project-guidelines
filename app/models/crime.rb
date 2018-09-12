class Crime   < ActiveRecord::Base
  belongs_to :areas
  # belongs_to :users through: :areas    -PROBABLY NOT RIGHT


# Dan's suggestion on how to create methods based on the JSON retrieved from crime_data.rb
  # def get_crimes
  #   return CrimeData.get_crimes_for_location(315315,535335)
  # end


end
