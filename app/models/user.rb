# frozen_string_literal: true

# Service to download ftp files from the server
class User < ApplicationRecord
  has_secure_password
  has_many :projects, dependent: :destroy
  has_and_belongs_to_many :features
  has_many :comments, dependent: :destroy

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: EMAIL_REGEX }
end
