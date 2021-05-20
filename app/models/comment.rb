# frozen_string_literal: true

# Service to download ftp files from the server
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :feature

  validates :comment, presence: true

  after_commit :create_notifications, on: %i[create update]
  has_many :sent_notifications, class_name: "Notification", foreign_key: :target_id, dependent: :destroy
  def create_notifications
    feature.users.each do |user|
      Notification.create(notify_type: 'comment', actor: self.user,
                          user: user, target: self)
    end
  end
end
