class Address
  attr_accessor :lat, :lon
  def initialize(street_address, street_address2, city, state, zipcode, lat, lon)
    @street_address = street_address
    @street_address2 = street_address2
    @city = city
    @state = state
    @zipcode = zipcode
    @lat = lat
    @lon = lon
  end

  # Array Matcher: match_array (keys)
  def as_json
    { street_address: @street_address,
      street_address2: @street_address2,
      city: @city,
      state: @state,
      zipcode: @zipcode,
      lat_lon: {
        lat: @lat,
        lon: @lon
      }
    }
  end

  # Array Matcher: contain_exactly
  def coordinates
    [ @lat, @lon ]
  end

  # String Matcher: include("")
  def full_address
    "#{@street_address}, #{@street_address_2}, #{@city}, #{@state}, #{@zipcode}"
  end

  # Regex Matcher: match(/\d{3}/)
  def street_address
    # simple street validation: 1 main st
    if @street_address.match?(/\d{1,3}.?\d{0,3}\s[a-zA-Z]{2,30}\s[a-zA-Z]{2,15}/)
      @street_address
    else
      ""
    end
  end
end
