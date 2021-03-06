# == Schema Information
#
# Table name: relationships
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer          not null
#  follower_id :integer          not null
#
# Indexes
#
#  index_relationships_on_followed_id                  (followed_id)
#  index_relationships_on_follower_id                  (follower_id)
#  index_relationships_on_follower_id_and_followed_id  (follower_id,followed_id) UNIQUE
#
class Relationship < ApplicationRecord

  include Rails.application.routes.url_helpers

  after_create_commit :create_notification

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  has_one :notification, as: :notifiable, dependent: :destroy

  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validates :follower_id, uniqueness: { scope: :followed_id }

  def partial_name
    "followed_me"
  end

  def resource_path
    user_path(followed)
  end

  private

  def create_notification
    Notification.create(notifiable: self, user: follower)
  end

end
