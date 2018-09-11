class Report   < ActiveRecord::Base
  belongs_to :crime_types
  belongs_to :addresses

end
