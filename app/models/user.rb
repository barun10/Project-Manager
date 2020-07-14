class User < ApplicationRecord

  has_secure_password
	has_many :projects
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name,	presence: true,
										uniqueness: {case_sensitive: false}


	validates :email, presence: true,
										uniqueness: {case_sensitive: false},
										format: { with: EMAIL_REGEX }

end
