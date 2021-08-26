
class User

attr_reader :name

  def initialize(name)
    @name = name
  end

  def create_space(name)
    #creates a new instance of the space class
    #Needs to be given arguments to define attributes
    #Store the info into the spaces table in the database

  end

  def create_booking
    # Booking.new("27-08-21", "29-08-21", 1, 2)
  end

end