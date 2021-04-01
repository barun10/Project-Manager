# frozen_string_literal: true

# Service to download ftp files from the server
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :feature

  validates :comment, presence: true

  after_commit :create_notifications, on: %i[create update]

  def create_notifications
    feature.users.each do |user|
      Notification.create(notify_type: 'comment', actor: self.user,
                          user: user, target: self)
    end
  end
end
