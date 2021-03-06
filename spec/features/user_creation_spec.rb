require 'rails_helper'

describe 'create new user sign up' do
  it 'create a new user' do
    visit 'tours#index'
    click_on 'Sign Up'
    visit signup_path
    fill_in 'user_email', :with => 'test@test.com'
    fill_in 'user_password', :with => 'Password1'
    fill_in 'user_password_confirmation', :with => 'Password1'
    fill_in 'User name', :with => 'Howdy123'
    have_select 'guide', selected: 'Attendee'
    attach_file 'user_avatar', "#{Rails.root}/spec/images/ghost.png"
    click_button "Sign Up"
    expect(page).to have_content "Thanks for signing up!"
  end

  it 'fail user creation' do
    visit signup_path
    click_button "Sign Up"
    expect(page).to have_content "There was a problem signing up."
  end
end
