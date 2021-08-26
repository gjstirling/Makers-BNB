# Create test attribute name for user

describe User do

  let(:booking)     { { start_date: "27-08-21", end_date: "29-08-21", user_id: 1, space_id: 2 } }
  let(:user)        { described_class.new('Zainab') }

  it 'should have a name' do
    expect(user.name).to eq('Zainab')
  end

  it 'should have a create space method' do 
    expect(user).to respond_to(:create_space)
  end

  describe '.create_booking' do
    it 'is expected to #create_booking' do
      expect(user).to respond_to(:create_booking)
    end

    it 'takes four arguments' do

    end

  end

end