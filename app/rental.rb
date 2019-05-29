class Rental

  attr_accessor :rented_at

  def initialize(available_at, agent, address)
    @available_at = available_at
    @agent = agent
    @address = address
  end

  # Equivalence Comparison matcher: eql
  def nearby?(lat, lon)
    # assumes flat plane
    Math.sqrt((lat-@address.lat) ** 2 + (lon-@address.lon) ** 2)
  end

  # Equivalence Comparison matcher: equal
  # Object Type Matcher: be_an(Agent)
  def agent
    @agent
  end

  # Object Type Matcher: kind_of(Address)
  def address
    @address
  end

  # Equivalence Comparison matcher: eq
  # Satisfy Matcher: satisfy (rework)
  # Predicate Matcher: be_zero for Time.current < @available_at case
  def days_on_market
    return 0 if Time.current < @available_at
    ((Time.current - @available_at)/ 1.day).floor
  end

  # Truthiness Comparison matcher: == true
  def rent!
    @rented_at = Time.current
  end

  # Truthiness Comparison matcher: == false
  def rented?
    @rented_at.present? && @rented_at <= Time.current
  end

  # Numeric Comparison matcher: <=
  def available?
    @available_at <= Time.current && !rented?
  end

  # Numeric Comparison matcher: be_between().inclusive
  def next_weeks_open_house_dates(open_house_dow)
    now = Time.current
    dates = []
    (0...7).each do |day_offset|
      date = now + day_offset.day
      if open_house_dow.include?(date.wday)
        dates << now + day_offset.day
      end
    end
    dates
  end

end
