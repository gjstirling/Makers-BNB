
describe Space do
  it 'should have a name' do
    space = Space.new('Bamboo Hut')
    expect(space.name).to eq('Bamboo Hut')
  end
end