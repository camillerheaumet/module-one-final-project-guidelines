class CrimeData
  def self.get_crimes_for_location(lat, lng)
    # this isn't an ideal way of dealing with urls, but it will suffice for the MVP
    url = "https://data.police.uk/api/crimes-street/all-crime?lat=#{lat}&lng=#{lng}"
    # binding.pry
    JSON.parse(RestClient.get(url))
  end

  def data_search
    true_data = true
    while true_data do
      new_area = Area.create(address: get_address, user: @user )
      if !!@user.areas.last.latitude
        true_data = false
      else
        puts "This Postcode is NOT valid."
      end
   end
   CrimeData.get_crimes_for_location(@user.areas.last.latitude, @user.areas.last.longitude)
  end
end
