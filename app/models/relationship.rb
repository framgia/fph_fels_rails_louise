class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  has_one :activity, as: :action, dependent: :destroy
  after_save :get_activity

  def get_activity
    create_activity(user_id: follower.id)
  end

end
