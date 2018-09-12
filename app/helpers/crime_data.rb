class CrimeData
  def self.get_crimes_for_location(lat, lng)
    # this isn't an ideal way of dealing with urls, but it will suffice for the MVP
    url = "https://data.police.uk/api/crimes-street/all-crime?lat=#{lat}&lng=#{lng}"
    # binding.pry
    JSON.parse(RestClient.get(url))
  end
end
