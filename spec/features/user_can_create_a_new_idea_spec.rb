require "rails_helper"

describe "User creates a new idea" do
  describe "a user goes to the create page" do
    it "creates a new page" do
      category = Category.create(title: "Gear")
      user = User.create!(username: "Alex", password: "cooldude", role: 1)

      visit user_path(user)
      expect(page).to have_content("Create a New Idea")

      select(category.title, :from => "idea_category_id")
      fill_in "idea[title]", with: "Scarpa shoes"
      fill_in "idea[body]", with: "Sweet Gear that I want"
      click_on "Create Idea"

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to have_content("Sweet Gear that I want")
    end
  end
end
