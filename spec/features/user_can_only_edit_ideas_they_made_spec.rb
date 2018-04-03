require "rails_helper"

describe "User edits an idea" do
  scenario "user must be the owner of that idea" do
    user = User.create!(username: "Alex", password: "password")
    category = Category.new(title: "Gear")
    idea = Idea.new(category_id: category.id, title: "Camping Supplies", body: "Stuff I want", user_id: user.id)
    session[:user_id] = user.id
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
binding.pry
    visit user_ideas_path(user)
    binding.pry
    click_on "Edit Idea"
    fill_in "idea[title]", with: "Routes"
    fill_in "idea[body]", with: "Dream Routes"
    click_on "Edit Idea"

    expect(page).to have_content("Routes")
    expect(page).to have_content("Dream Routes")
    expect(current_path).to eq(user_ideas_path(user))
  end
end
