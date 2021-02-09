class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :feature

  after_commit :create_notifications, on: [:create, :update]
  def create_notifications
    self.feature.users.each do |user|
      Notification.create(notify_type: 'comment', actor: self.user,
                          user: user, target: self)
    end
  end
end
