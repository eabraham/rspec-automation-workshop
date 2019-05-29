class Agent

  attr_accessor :full_name

  #Attribute Matcher: have_attributes
  def initialize(full_name)
    @full_name = full_name
  end

  def first_name
    @full_name.split(" ").first
  end

  def last_name
    @full_name.split(" ").last
  end
end
