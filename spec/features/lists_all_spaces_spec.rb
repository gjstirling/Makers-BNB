feature 'lists the spaces' do

  scenario 'When on the index route, spaces are listed for users to view' do
    visit('/bnb/listings')
    expect(page).to have_content('Space 1')
    expect(page).to have_button('View space')
    expect(page).to have_button('Create space')
  end

end
