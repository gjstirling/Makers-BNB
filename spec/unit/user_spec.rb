# Create test attribute name for user

describe User do

  it 'should have a name' do
    user = User.new('Zainab')
    expect(user.name).to eq('Zainab')
  end

  it 'should have a create space method' do 
    user = User.new('Graeme')
    expect(user).to respond_to(:create_space)
  end 

end