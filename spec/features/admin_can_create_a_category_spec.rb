require "rails_helper"

describe "User creates a new category" do
  context "as an admin" do
    it "creates a new category" do
      user = User.create(username: "Alex", password: "boom", role: 1)

      visit admin_new_category_path
      click_on "New Category"

      fill_in "title", with: "Gear"
      click_on "Submit"

      expect(page).to have_content("Gear")
      expect("Gear").to eq(Category.last.title)
    end
  end
  context "as an default user" do
    it "doesn't create a category" do
      user = User.create(username: "Alex", password: "boom", role: 1)

      visit admin_new_category_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
