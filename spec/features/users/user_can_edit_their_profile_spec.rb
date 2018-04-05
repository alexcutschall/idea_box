require 'rails_helper'

describe "user information" do
  scenario "user edits their profile information" do
    user = User.create!(username: "Batman", password: "Robin")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on "Edit Profile"

    fill_in "user[username]", with: "Joker"
    fill_in "user[password]", with: "Harley Quinn"

    click_on "Update User"

    expect(page).to have_content("Welcome, Batman!")
  end
end
