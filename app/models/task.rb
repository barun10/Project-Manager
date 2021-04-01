# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :feature

  validates :description, presence: true, uniqueness: { case_sensitive: false }

  scope :completed, -> { where(status: true) }
end
