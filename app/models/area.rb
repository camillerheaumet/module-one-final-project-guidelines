require 'rest-client'


class Area < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  geocoded_by :address
  before_create :geocode
  has_many :crimes
  belongs_to :users


#  Method to convert inputted address into coordinates

  def convert_address_to_coordinates
    ## this converts the user address into coordinates,
    ## and this method is already called within the next ones, we don't need to call it in run
    results = Geocoder.search(self.address)
    results.first.coordinates
    ## self.latitude = results.first.coordinates[0]
    ## self.longitude = results.first.coordinates[1]
  end
end
