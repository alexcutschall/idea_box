require "rails_helper"

describe "Authentication" do
  scenario "allows a user to sign it" do
    visit '/'

    click_on "Sign Up!"
    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "awesomedude"
    fill_in "user[password]", with: "password"
    click_on "Create User"

    expect(page).to have_content("Welcome, awesomedude")
  end
  scenario "allows a user to sign in" do
    user = User.create(username: "Bobby", password: "awesomedude")
    visit '/'

    click_on "Log In"
    expect(current_path).to eq(login_path)

    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to have_content("Log Out")
  end
  scenario "user can't go to someone else's page" do
    user = User.create(username: "Bobby", password: "awesomedude")
    user2 = User.create(username: "Ricky", password: "awesomedude2")
    visit '/'
    click_on "Log In"

    visit "/users/#{user2.id}"
    expect(page).to have_content("Sorry, You're not authorized to view this page!")
  end
end
