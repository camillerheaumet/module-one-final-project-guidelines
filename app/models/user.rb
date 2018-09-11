class User   < ActiveRecord::Base
  has_many :areas
  has_many :crimes, through: :areas

end
