class CrimeData
  def self.get_crimes_for_location(lat, lng)
    # this isn't an ideal way of dealing with urls, but it will suffice for the MVP
    url = "https://data.police.uk/api/crimes-at-location?lat=#{lat}&lng=#{lng}"
    JSON.parse(RestClient.get(url))
  end
end
