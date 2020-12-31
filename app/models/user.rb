class User < ApplicationRecord

  has_secure_password
	has_many :projects, dependent: :destroy
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name,	presence: true,
										uniqueness: {case_sensitive: false}


	validates :email, presence: true,
										uniqueness: {case_sensitive: false},
										format: { with: EMAIL_REGEX }
	has_and_belongs_to_many :features

  has_and_belongs_to_many :tasks
end