class Crime   < ActiveRecord::Base
  belongs_to :areas
  # belongs_to :users through: :areas    -PROBABLY NOT RIGHT

end
