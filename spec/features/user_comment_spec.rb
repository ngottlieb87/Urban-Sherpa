require 'rails_helper'

describe 'leave comment on tour' do
  it 'create comment', js:true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit 'tours#index'
    tour = FactoryBot.create(:tour)
    click on tour.title
    visit tour_path(tour)
    expect(page).to have_content 'Night Hike'
  end
end
