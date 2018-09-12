require 'rest-client'

class Area < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
    geocoded_by :address
    before_create :geocode
    belongs_to :user
    has_many :crimes
end
