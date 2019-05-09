require 'rails_helper'

feature 'deleting posts' do
  background do
    post = create(:post, caption: 'Accidental nudity')
    user = create :user


    sign_in_with (user)

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'can delete a single post' do
    click_link 'Delete Post'
    expect(page).to have_content('Post Deleted!')
    expect(page).to_not have_content('Accidental nudity')
  end
end
