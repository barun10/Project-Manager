# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :feature

  validates :description, presence: true, uniqueness: { case_sensitive: false }

  scope :completed, -> { where(status: true) }

  after_update :update_feature_status, if: -> { status? }

  def update_feature_status
    unless feature.status == 'delivered' || feature.status == 'completed'
      feature.status = 'started'
      feature.save
    end
  end
end
