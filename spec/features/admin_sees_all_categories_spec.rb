require "rails_helper"

describe "User visits the categories index page" do
  context "as admin" do
    it "should show admin all of the categories" do
      user = User.create(username: "Alex", password: "boom", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path
      expect(page).to have_content("Admin Categories")
    end
  end
  context "as default" do
    it "should not show them all categories" do
      user = User.create(username: "Alex", password: "boom", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_categories_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
