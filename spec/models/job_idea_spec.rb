require "rails_helper"

describe JobIdea do
  describe "relationships" do
    it "should belong to an image" do
      job_idea = JobIdea.create()

      expect(job_idea).to respond_to(:image)
    end
    it "should belong to an idea" do
      job_idea = JobIdea.create()

      expect(job_idea).to respond_to(:idea)
    end
  end
end
