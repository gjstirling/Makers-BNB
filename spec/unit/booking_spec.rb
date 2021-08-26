describe Booking do   

  let(:booking) { described_class.new("27-08-21", "29-08-21", 1, 2) }

  it "Creates a booking instance" do 
    expect(booking).to be_an_instance_of(Booking)
  end 

  it "Contains attributes start_date, end_date" do 
    expect(booking).to have_attributes(:start_date => "27-08-21", :end_date => "29-08-21", :user_id => 1, :space_id => 2)
  end

end 
