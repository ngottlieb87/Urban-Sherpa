require 'rails_helper'

describe 'user sign in' do
  it 'create a new user', js:true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:account)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit new_tour_path
    fill_in 'tour_title', :with => "Night Hike"
    fill_in "tour_description", :with => "A hike at night"
    fill_in "tour_location", :with => "Portland,Or"
    fill_in "tour_date", :with=> "2019/01/01"
    find("#tour_time_4i").find(:option, "12 AM").select_option
    find("#tour_time_5i").find(:option, "00").select_option
    fill_in "tour_price", :with => 50
    attach_file 'tour_photo', "#{Rails.root}/spec/images/party.jpeg"
    click_on "Create Tour"
    visit "tours/#{Tour.first.id}"
    fill_in "tour_order_quantity", :with => 1
    click_on "Add to Your Itinerary"
    visit "users/#{User.first.id}"
    accept_confirm do
      click_on "Delete Account"
    end
    expect(page).to have_content "Account Removed"
  end
end
