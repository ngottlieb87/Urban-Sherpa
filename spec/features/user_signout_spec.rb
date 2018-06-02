require 'rails_helper'

describe 'user sign out process' do
  it 'signs user out', js:true do
    visit 'tours#index'
    click_link 'Sign In'
    user = FactoryBot.create(:user)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit '/signout'
    expect(page).to have_content "You've signed out."
  end
end
