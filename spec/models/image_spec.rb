require "rails_helper"

describe Image do
  describe "relationships" do
    it "should have many ideas" do
      image = Image.create(title: "Shoes", url: "/fakeurl")

      expect(image).to respond_to(:ideas)
    end
  end
end
