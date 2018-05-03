require 'rails_helper'

describe 'user sign in' do
  it 'create a new user', js:true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    expect(page).to have_content "You've signed in."
  end
  
  it 'fail user sign in', js:true do
    visit 'tours#index'
    click_on 'Sign In'
    fill_in 'email', :with => "test@test.com"
    fill_in 'password', :with => "password"
    click_button "Sign in"
    expect(page).to have_content "There was a problem signing in. Please try again."
  end
end
