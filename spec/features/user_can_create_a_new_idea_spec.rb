require "rails_helper"

describe "User creates a new idea" do
  describe "a user goes to the create page" do
    it "creates a new page" do
      user = User.create(username: "Alex", password: "cooldude")
      visit '/'
      click_on "Log In"
      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_on "Log In"

      click_on "Create a New Idea"

      select "Gear", from: "Category"
      fill_in "body", with: "Sweet Gear that I want"
      click_on "Create Idea"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Sweet Gear that I want")
    end
  end
end
