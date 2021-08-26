describe Space do
  it 'should have name, description, price, capacity, owner_id' do
    space = Space.new('Bamboo Hut', 'A modern clean space', 90, 1, 3)
    expect(space.name).to eq('Bamboo Hut')
    expect(space.description).to eq('A modern clean space')
    expect(space.price).to eq(90)
    expect(space.capacity).to eq(1)
    expect(space.owner_id).to eq(3)
  end
end
