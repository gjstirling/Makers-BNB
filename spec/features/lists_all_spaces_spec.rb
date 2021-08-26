require './spec/web_helper.rb'
feature 'lists the spaces' do
  spaces = reset_table_space_and_seed
  scenario 'When on the index route, spaces are listed for users to view' do
    visit('/')
    spaces.each_with_index do |space, index|
      expect(page).to have_content(space["name"])
      expect(page).to have_content(space["description"])
      expect(page).to have_content(space["price"])
      expect(page).to have_content(space["capacity"])
    end
  end

end
