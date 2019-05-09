require 'rails_helper'

feature 'An individual post can be edited' do
  background do
    post = create :post
    user = create :user

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end



  scenario 'the post has an option to edit and update' do
    fill_in 'Caption', with: "I forgot to add a caption!"
    click_button 'Update Post'

    expect(page).to have_content("Post Updated")
    expect(page).to have_content("I forgot to add a caption")
  end

  scenario "won't update  post without an image" do
    attach_file('Image', "spec/files/neon1.zip")
    click_button 'Update Post'

    expect(page).to have_content("There is something wrong with your update")
  end
end
