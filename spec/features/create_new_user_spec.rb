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
    click_button 'Sign up'
    expect(page).to have_content('You have signed up successfully')
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'jpr@gmail.com'
    fill_in 'Password', with: 'james123', match: :first
    fill_in 'Password confirmation', with: 'james123'
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'User name', with: 'h'
    fill_in 'Email', with: 'sxyrailsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'
    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end

  scenario 'requires a user name to be less than 12 characters' do
  fill_in 'User name', with: 'h' * 13
  fill_in 'Email', with: 'sxyrailsdev@myspace.com'
  fill_in 'Password', with: 'supersecret', match: :first
  fill_in 'Password confirmation', with: 'supersecret'
  click_button 'Sign up'
  expect(page).to have_content("maximum is 12 characters")
end
end
