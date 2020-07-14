class Project < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  validates :name, presence: true, uniqueness: { case_sensitive: false } 
end