class CrimeTypes    < ActiveRecord::Base
  has_many :reports
  has_many :addresses, through: :reports

end
