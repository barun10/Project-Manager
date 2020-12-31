class Task < ApplicationRecord
  belongs_to :feature
  validates :description, presence: true, uniqueness: { case_sensitive: false }
  scope :completed, -> { where(:status => true)}
  has_and_belongs_to_many :users
end
