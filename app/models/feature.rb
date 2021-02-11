class Feature < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :project
  has_one_attached :file
  has_and_belongs_to_many :users
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 10}
  validates :description, presence: true
  validates :status, presence: true

  after_commit :create_notifications, on: :update

  def create_notifications
    self.users.each do |user|
      Notification.create(notify_type: 'feature', user: user, target: self)
    end
  end
end
