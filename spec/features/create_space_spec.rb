require './spec/web_helper.rb'
feature 'create a space' do
  spaces = reset_table_space_and_seed

  scenario 'We see an error message if creation of space is not successful' do
    visit('/create_space')
    fill_in('name', with: 'Seaside Lodge')
    fill_in('description', with: 'It is nice')
    fill_in('price', with: "ff" )
    fill_in('capacity', with: 33 )
    click_button('Create space')
    expect(page).to have_current_path('/create_space?error=Something went wrong..')
    expect(page).to have_content ('Something went wrong..')
  end

  scenario 'it works adding spaces to db table' do
    visit('/create_space')
    fill_in('name', with: "Seasides Lodge")
    fill_in('description', with: 'It is nice')
    fill_in('price', with: 22 )
    fill_in('capacity', with: 22 )
    click_button('Create space')
    # expect(page).to have_content ("Seaside&#39;s Lodge")
    expect(page).to have_current_path('/')
  end

end