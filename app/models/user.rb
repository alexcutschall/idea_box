class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  enum role: %w(default admin)
  has_many :ideas
end
