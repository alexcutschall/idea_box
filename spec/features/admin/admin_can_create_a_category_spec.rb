require "rails_helper"

describe "User creates a new category" do
  context "as an admin" do
    it "creates a new category" do
      user = User.create(username: "Alex", password: "boom", role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path
      click_on "New Category"
      expect(current_path).to eq(new_admin_category_path)

      fill_in "category[title]", with: "Gear"
      click_on "Create Category"

      expect(page).to have_content("Gear")
      expect("Gear").to eq(Category.last.title)
    end
  end
  context "as an default user" do
    it "doesn't create a category" do
      user = User.create(username: "Alex", password: "boom", role: 1)

      visit new_admin_category_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
