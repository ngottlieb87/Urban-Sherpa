require "rails_helper"

describe "filters tours on user filter selection" do
  it "displays tours default" do
      FactoryBot.create(:user)
      FactoryBot.create(:account)
      tour1=FactoryBot.create(:tour)
      tour2=FactoryBot.create(:tour2)
      tour3=FactoryBot.create(:tour3)
      expect(Tour.all).to eq [tour1, tour2, tour3]
  end

  it "displays tours from a-z" do
    FactoryBot.create(:user)
    FactoryBot.create(:account)
    tour1=FactoryBot.create(:tour)
    tour2=FactoryBot.create(:tour2)
    tour3=FactoryBot.create(:tour3)
    expect(Tour.all.a_z).to eq [tour1, tour3, tour2]
  end

  it "displays tours from z-a" do
    FactoryBot.create(:user)
    FactoryBot.create(:account)
    tour1=FactoryBot.create(:tour)
    tour2=FactoryBot.create(:tour2)
    tour3=FactoryBot.create(:tour3)
    expect(Tour.all.z_a).to eq [tour2, tour3, tour1]
  end

  it "displays most recently created tour" do
    FactoryBot.create(:user)
    FactoryBot.create(:account)
    tour2=FactoryBot.create(:tour2)
    tour1=FactoryBot.create(:tour)
    tour3=FactoryBot.create(:tour3)
    expect(Tour.all.most_recent).to eq [tour3, tour1, tour2]
  end

  it "displays oldest tours first" do
    FactoryBot.create(:user)
    FactoryBot.create(:account)
    tour2=FactoryBot.create(:tour2)
    tour1=FactoryBot.create(:tour)
    tour3=FactoryBot.create(:tour3)
    expect(Tour.all.oldest).to eq [tour2, tour1, tour3]
  end

  it "displays tour with most comments", js: true do
    user=FactoryBot.create(:user)
    user2=FactoryBot.create(:attendee)
    FactoryBot.create(:account)
    FactoryBot.create(:account2)
    tour1=FactoryBot.create(:tour)
    tour2=FactoryBot.create(:tour2)
    tour3=FactoryBot.create(:tour3)
    visit "tours#index"
    click_on 'Sign In'
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit "tours/#{Tour.last.id}"
    click_on "Let others know what you think about it!"
    fill_in "comment_body", :with => "Was great!"
    click_button "Leave Comment"
    visit "/signout"
    click_on 'Sign In'
    fill_in 'email', :with => user2.email
    fill_in 'password', :with => user2.password
    click_button "Sign in"
    visit "tours/#{Tour.last.id}"
    click_on "Leave a comment"
    fill_in "comment_body", :with => "Lorem Ipsum"
    click_button "Leave Comment"
    visit "tours/#{Tour.first.id}"
    click_on "Let others know what you think about it!"
    fill_in "comment_body", :with => "Lorem Ipsum Decorum"
    click_button "Leave Comment"
    expect(Tour.all.most_reviewed).to eq [tour3, tour1]
  end
end
