require "rails_helper"

describe "User visits a show page" do
  scenario "user sees individual ideas information" do
    category = Category.create!(title: "Supergear")
    user = User.create(username: "Batman", password: "Robin")
    idea = Idea.create!(title: "BatWing", body: "It's really cool and scary", user_id: user.id, category_id: category.id)
    image = Image.new(title: "shoes", url: "fakeurl")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_ideas_path(user)

    within(".ideas_#{idea.id}") do
      click_on idea.title
    end

    expect(current_path).to eq(user_idea_path(user, idea))
    expect(page).to have_content(idea.title)
    expect(page).to have_content(idea.body)
  end
end
