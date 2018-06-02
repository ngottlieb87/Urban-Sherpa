require 'rails_helper'

describe 'user sign in' do
  it 'create a new user', js:true do
    visit 'tours#index'
    click_link 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:account)
    FactoryBot.create(:tour)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit "tours/#{Tour.first.id}"
    find("#tour_order_quantity").find(:option, "1").select_option
    click_on "Add to Your Itinerary"
    visit "users/#{User.first.id}"
    accept_confirm do
      click_on "Delete Account"
    end
    expect(page).to have_content "Account Removed"
  end
end
