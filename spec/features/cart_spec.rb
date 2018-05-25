require 'rails_helper'

describe 'add tour to cart' do
  it 'adds tour to cart', js:true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:account)
    FactoryBot.create(:tour)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit "tours/#{Tour.first.id}"
    find("#tour_order_quantity").find(:option, "1").select_option
    click_on "Add to Your Itinerary"
    visit cart_path
    click_on "Checkout"
    expect(page).to have_content "Your Total:#{tour.price}"
  end

  it "fails cart without signin" do
    visit "/cart"
    expect(page).to have_content "Please sign in to access cart"
  end
end
