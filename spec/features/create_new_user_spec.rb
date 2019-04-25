require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'can create a new user from the index page' do
    fill_in 'User name', with: 'jprudrum'
    fill_in 'Email', with: 'jpr@gmail.com'
    fill_in 'Password', with: 'james123', match: :first
    fill_in 'Password confirmation', with: 'james123'

    click_button 'Sign Up'
    expect(page).to have_content('You have signed up successfully!!!')
  end
end
