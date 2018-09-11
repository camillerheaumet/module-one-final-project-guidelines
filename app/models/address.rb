class Address < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  geocoded_by :address
  after_create :geocode
  has_many :reports
  has_many :crime_types, through: :reports


#  Method to convert inputted address into coordinates

  def convert_address_to_coordinates
    # this converts the user address into coordinates,
    # and this method is already called within the next ones, we don't need to call it in run
    results = Geocoder.search(self.address)
    results.first.coordinates
    self.lat = results.first.coordinates[0]
    self.long = results.first.coordinates[1]
  end
end
