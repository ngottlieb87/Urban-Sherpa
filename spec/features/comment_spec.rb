require 'rails_helper'

describe "user comment spec" do
  it 'lets user create comment for tour', js:true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:tour)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit '/signout'
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:attendee)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit "tours/#{Tour.first.id}"
    click_on "Let others know what you think about it!"
    fill_in "comment_body", :with => "Was great!"
    click_button "Leave Comment"
    expect(page).to have_content "Comment Added!"
  end

  it "comment creation fail", js:true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:tour)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit '/signout'
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:attendee)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit "tours/#{Tour.first.id}"
    click_on "Let others know what you think about it!"
    fill_in "comment_body", :with => " "
    click_button "Leave Comment"
    expect(page).to have_content "Comment field can't be blank"
  end

  it "lets user edit comment", js: true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:tour)
    FactoryBot.create(:comment)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit "tours/#{Tour.first.id}"
    click_on "Edit Comment"
    fill_in 'comment_body', with: "New Comment"
    click_button "Leave Comment"
    expect(page).to have_content "New Comment"
  end

  it "lets user delete comment", js: true do
    visit 'tours#index'
    click_on 'Sign In'
    user = FactoryBot.create(:user)
    FactoryBot.create(:tour)
    FactoryBot.create(:comment)
    fill_in 'email', :with => user.email
    fill_in 'password', :with => user.password
    click_button "Sign in"
    visit "tours/#{Tour.first.id}"
    accept_confirm do
      click_on "Delete Comment"
    end
    expect(page).to have_content "Comment Removed"
  end
end
