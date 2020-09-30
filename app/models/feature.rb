class Feature < ApplicationRecord
  has_many :tasks
  belongs_to :project
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 10}
  validates :description, presence: true
  has_one_attached :file
end
