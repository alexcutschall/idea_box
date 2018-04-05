class Image < ApplicationRecord
  has_many :ideas, through: :job_ideas
end
