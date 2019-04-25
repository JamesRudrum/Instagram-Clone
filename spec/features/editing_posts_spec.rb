require 'rails_helper'

feature 'An individual post can be edited' do
  scenario 'the post has an option to edit and update' do
    post_one = create(:post, caption: "")
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    fill_in 'Caption', with: "I forgot to add a caption!"
    click_button 'Update Post'
    expect(page).to have_content("Post Updated")
    expect(page).to have_content("I forgot to add a caption")
  end
  it "won't update  post without an image" do
    post_one = create(:post, caption: "")
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
    attach_file('Image', "spec/files/neon1.zip")
    click_button 'Update Post'
    expect(page).to have_content("There is something wrong with your update")
  end
end
