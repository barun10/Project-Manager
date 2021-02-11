class User < ApplicationRecord
  has_secure_password
	has_many :projects, dependent: :destroy
	has_and_belongs_to_many :features
	has_many :comments, dependent: :destroy

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
										uniqueness: {case_sensitive: false},
										format: { with: EMAIL_REGEX }
										
end