# Create test attribute name for user

describe User do
  it 'should have a name' do
    user = User.new('Zainab')
    expect(user.name).to eq('Zainab')
  end
end