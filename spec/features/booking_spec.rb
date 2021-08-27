require './spec/web_helper.rb'


feature 'create a booking' do
  reset_table_space_and_seed
  scenario 'we should create a booking' do
    visit('/')
    click_button('Book space space1')
    expect(page).to have_title('Create booking')
  end
end