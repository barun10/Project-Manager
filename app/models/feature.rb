class Feature < ApplicationRecord
  belongs_to :project
  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 10}
  validates :description, presence: true
end
