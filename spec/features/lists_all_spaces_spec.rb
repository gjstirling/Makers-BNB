feature 'lists the spaces' do

  scenario 'When on the index route, spaces are listed for users to view' do
    visit('/bnb/listings')
    expect(page).to have_content('Listings')
    expect(page).to have_button('View space')
    expect(page).to have_button('List space')
  end

end
