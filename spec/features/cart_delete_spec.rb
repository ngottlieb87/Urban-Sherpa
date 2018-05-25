require 'rails_helper'

describe 'add tour to cart' do
  it 'adds tour to cart', js:true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:account)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    FactoryBot.create(:tour)
    visit "tours/#{Tour.first.id}"
    find("#tour_order_quantity").find(:option, "1").select_option
    click_on "Add to Your Itinerary"
    visit cart_path
    accept_confirm do
      click_on "Remove"
    end
    expect(page).to have_content "Tour Removed"
  end
end
