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

  def get_json
    hash = RestClient.get(https://data.police.uk/api/crimes-at-location?date=2017-02&lat=52.629729&lng=-1.131592)


  end


end
