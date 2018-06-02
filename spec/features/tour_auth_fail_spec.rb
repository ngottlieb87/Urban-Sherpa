require 'rails_helper'

describe 'fail authorizations for tour' do
  it 'fail auth routing for tour creation', js: true do
    visit 'tours#index'
    click_link 'Sign In'
    user = FactoryBot.create(:attendee)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit new_tour_path
    expect(page).to have_content 'Must be a guide to create tours!'
  end

  it 'fail tour authorization edit',js:true do
    visit 'tours#index'
    click_link 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:tour)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit '/signout'
    visit 'tours#index'
    click_link 'Sign In'
    user = FactoryBot.create(:attendee)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit "tours/#{Tour.first.id}/edit"
    expect(page).to have_content 'You do not have access to change this tour!'
  end
end
