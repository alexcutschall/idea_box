class Idea < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :user
  belongs_to :category
  has_many :job_ideas
  has_many :images, through: :job_ideas
end
