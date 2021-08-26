class Booking

  attr_reader :start_date, :end_date, :user_id, :space_id

  def initialize(start_date, end_date, user_id, space_id)
    @start_date = start_date
    @end_date = end_date
    @user_id = user_id
    @space_id = space_id
  end 
end 
