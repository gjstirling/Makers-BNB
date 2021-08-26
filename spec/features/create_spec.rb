feature 'create a space' do

  scenario 'We see an error message if creation of space is not successful' do
    visit('/create')
    fill_in('name', with: 'Seaside Lodge')
    fill_in('description', with: 'It is nice')
    fill_in('price', with: "ff" )
    click_button('Create space')
    expect(page).to have_content ('Something went wrong..')
  end

end