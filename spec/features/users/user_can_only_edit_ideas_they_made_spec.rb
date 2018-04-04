require "rails_helper"

describe "User edits an idea" do
  scenario "user must be the owner of that idea" do
    user = User.create!(username: "Alex", password: "password")
    category = Category.create(title: "Gear")
    idea = Idea.create(category_id: category.id, title: "Camping Supplies", body: "Stuff I want", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_ideas_path(user)

    click_on "Edit Idea"

    fill_in "idea[title]", with: "Routes"
    fill_in "idea[body]", with: "Dream Routes"
    click_on "Update Idea"

    expect(page).to have_content("Routes")
    expect(page).to have_content("Dream Routes")
    expect(current_path).to eq(user_ideas_path(user))
  end
  scenario "user cannot edit other users ideas" do
    user = User.create!(username: "Alex", password: "password")
    user_2 = User.create(username: "Jimmy", password: "coolguy")
    category = Category.create(title: "Gear")
    idea = Idea.create(category_id: category.id, title: "Camping Supplies", body: "Stuff I want", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_ideas_path(user_2)

    expect(page).to have_content("Sorry, You're not authorized to view this page!")
  end
end
