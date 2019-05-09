require 'spec_helper'

feature 'Can view individual posts' do
  background do
      user = create :user
      post = create :post

      visit '/'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
  end

  scenario 'Can click and view a single post' do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(1))
  end
end
