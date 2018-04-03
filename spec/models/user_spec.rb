require "rails_helper"

describe User, model: :type do
  describe "validations" do
    it "should have a username" do
      user = User.create(password: "boom", role: 0)

      expect(user).to be_invalid
    end
    it "should have a unique username" do
      user = User.create(username: "Alex", password: "boom", role: 0)
      user2 = User.create(username: "Alex", password: "shazam", role: 0)

      expect(user2).to be_invalid
    end
  end
  describe "roles" do
    it "can be created as an admin" do
      user = User.create(username: "Alex", password: "boom", role: 1)
      user2 = User.create(username: "Alex", password: "boom")

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
      expect(user2.admin?).to be_falsy
    end
    it "can be created as a default user" do
      user = User.create(username: "Alex", password: "boom", role: 1)
      user2 = User.create(username: "Alex", password: "boom")

      expect(user2.role).to eq("default")
      expect(user2.default?).to be_truthy
      expect(user.default?).to be_falsy
    end
  end
end
