require 'rails_helper'

describe 'guide creates tour', js:true do
  it 'creates new tour' do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit new_tour_path
    fill_in 'tour_title', :with => "Night Hike"
    fill_in "tour_description", :with => "A hike at night"
    fill_in "tour_location", :with => "Portland,Or"
    fill_in "tour_date", :with=> "2019/01/01"
    select(option, value="01", from: "tour_time_4i")
    select(option, value="00", from: "tour_time_5i")
    fill_in "price", :with => 50
    click_on "Create Tour"
    expect(page).to have_content "Tour Created"
  end
end
