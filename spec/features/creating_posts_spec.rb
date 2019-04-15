require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/neon_city_1.tif")
    fill_in 'Caption', with: 'Hong Kong at night #hongkong'
    click_button 'Create Post'
    expect(page).to have_content('#hongkong')
    expect(page).to have_css("img[src*='neon_city_1.tif']")
  end
end
