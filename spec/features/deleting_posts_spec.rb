require 'rails_helper'

feature 'deleting posts' do
  background do
    post = create(:post, caption: 'Accidental nudity')
    user = create :user


    visit('/')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  
  scenario 'can delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content('Post Deleted!')
    expect(page).to_not have_content('Accidental nudity')
  end
end
