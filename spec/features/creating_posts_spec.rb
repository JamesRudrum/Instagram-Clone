require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    user = create :user
    
    sign_in_with (user)
  end

  scenario 'can create a post' do
    visit '/'
    first(:link, 'New Post').click
    attach_file('Image', "spec/files/images/neon_city_1.tif")
    fill_in 'Caption', with: 'Hong Kong at night #hongkong'
    click_button 'Create Post'
    expect(page).to have_content('#hongkong')
    expect(page).to have_css("img[src*='neon_city_1.tif']")
  end

  it 'needs an image to create a post' do
    visit '/'
    first(:link, 'New Post').click
    fill_in 'Caption', with: "I have not added an image"
    click_button 'Create Post'
    expect(page).to have_content("You need an image to be able to post!!!")
  end
end
