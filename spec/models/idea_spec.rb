require "rails_helper"

describe Idea do
  describe "validations" do
    it "should have a title" do
      category = Category.create(title: "Gear")
      idea = Idea.new(category_id: category.id, body: "Sweet gear")

      expect(idea).to be_invalid
    end
    it "should have a body" do
      category = Category.create(title: "Gear")
      idea = Idea.new(category_id: category.id, title: "Sweet gear")

      expect(idea).to be_invalid
    end
  end
  describe "relationships" do
    it "should belong to a category" do
      category = Category.create(title: "Gear")
      idea = Idea.new(category_id: category.id, title: "Sweet gear")

      expect(idea).to respond_to(:category)
    end
    it "should belong to a category" do
      category = Category.create(title: "Gear")
      idea = Idea.new(category_id: category.id, title: "Sweet gear")

      expect(idea).to respond_to(:user)
    end
  end
end
