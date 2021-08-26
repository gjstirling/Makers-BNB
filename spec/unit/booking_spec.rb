describe Booking do   
  it "Creates a booking instance" do 
    booking = Booking.new 
    expect(booking).to be_an_instance_of(Booking)
  end 

end 