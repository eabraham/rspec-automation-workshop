class ForeignAddress < Address
  def initialize(street_address, street_address_2, city, state, zipcode, country, lat, lon)
    super(street_address, street_address_2, city, state, zipcode, lat, lon)
    @country = country
  end

  #Respond To Matcher: respond_to
  def country
    @country
  end
end
