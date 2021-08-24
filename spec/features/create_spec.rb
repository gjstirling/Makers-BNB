feature 'create a space' do

  scenario 'When create space button is clicked user is taken to this page' do
    visit('/bnb/listings')
    click_button('List space')
    fill_in('Space Name', with: 'Seaside Lodge')
    fill_in('Description', with: 'It is nice')
    fill_in('Price', with: '£90 per night' )
    expect(page).to have_content ('Seaside Lodge')
    expect(page).to have_content ('It is nice')
    expect(page).to have_content ('£90 per night')
    click_button('Create listing')
  end

end