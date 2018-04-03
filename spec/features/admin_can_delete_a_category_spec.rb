require "rails_helper"

describe "User can delete a category" do
  context "as an admin" do
    it "deletes a category" do
      user = User.create(username: "Alex", password: "shazam", role: 1)
      category = Category.create(title: "Gear")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path
      click_on "Delete"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to_not have_content(category.title)
    end
  end
  context "as a default user" do
    it "can't delete a category" do
      user = User.create(username: "Alex", password: "shazam", role: 0)
      category = Category.create(title: "Gear")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
