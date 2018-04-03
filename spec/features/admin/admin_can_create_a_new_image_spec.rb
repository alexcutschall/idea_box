require "rails_helper"

describe "Creating a new image" do
  scenario "admin creates a new image" do
    user = User.create(username: "Batman", password: "Robin", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_image_path

    fill_in "image[url]", with: "https://images.pexels.com/photos/306531/pexels-photo-306531.jpeg?cs=srgb&dl=adventure-climb-climber-306531.jpg&fm=jpg"
    click_on "Create Image"

    expect(current_path).to eq(admin_images_path)
  end
end
