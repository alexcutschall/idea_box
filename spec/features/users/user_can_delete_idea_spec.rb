require "rails_helper"

describe "User deletes an idea" do
  scenario "as correct user" do
    user = User.create!(username: "Alex", password: "password")
    category = Category.create(title: "Gear")
    idea = Idea.create(category_id: category.id, title: "Camping Supplies", body: "Stuff I want", user_id: user.id)
    idea_2 = Idea.create(category_id: category.id, title: "Belay Devices", body: "Gear that I need", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_ideas_path(user)
    
    within(".ideas_#{idea.id}") do
      click_on "Delete Idea"
    end

    expect(page).to have_content(idea_2.title)
    expect(page).to_not have_content(idea.title)
    expect(page).to_not have_content(idea.body)
  end
  scenario "as wrong user" do
    user = User.create!(username: "Alex", password: "password")
    user_2 = User.create!(username: "Jimmy", password: "password")
    category = Category.create(title: "Gear")
    idea = Idea.create(category_id: category.id, title: "Camping Supplies", body: "Stuff I want", user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit user_ideas_path(user_2)

    expect(page).to have_content("Sorry, You're not authorized to view this page!")
  end
end
