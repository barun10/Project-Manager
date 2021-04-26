# frozen_string_literal: true

# Service to download ftp files from the server
class Feature < ApplicationRecord
  enum status: %i[started completed delivered]
  has_many :tasks, dependent: :destroy
  belongs_to :project
  has_one_attached :file
  has_and_belongs_to_many :users
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :status, presence: true
  validates :panel_name, presence: true

  after_commit :create_notifications, on: :update

  def create_notifications
    users.each do |user|
      Notification.create(notify_type: 'feature', user: user, target: self)
    end
  end
end
