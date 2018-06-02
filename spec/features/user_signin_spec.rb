require 'rails_helper'

describe 'user sign in' do
  it 'create a new user', js:true do
    visit 'tours#index'
    click_link 'Sign In'
    user = FactoryBot.create(:user)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    expect(page).to have_content "Welcome back #{user.user_name}"
  end

  it 'fail user sign in', js:true do
    visit 'tours#index'
    click_link 'Sign In'
    fill_in 'email', :with => "test@test.com"
    fill_in 'password', :with => "password"
    click_button "Sign in"
    expect(page).to have_content "There was a problem signing in. Please try again."
  end

  it 'fail access without account' do
    visit 'users/1'
    expect(page).to have_content "Please sign in/Create account to access"
  end

  it 'fail signed in user from accessing others account', js:true do
    visit 'tours#index'
    click_link 'Sign In'
    FactoryBot.create(:user)
    user=FactoryBot.create(:attendee)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit '/users/1'
    expect(page).to have_content "You do not have access to this account"
  end
end
