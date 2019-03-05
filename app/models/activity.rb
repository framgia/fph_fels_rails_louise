class Activity < ApplicationRecord
  belongs_to :action, polymorphic: true
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
end
