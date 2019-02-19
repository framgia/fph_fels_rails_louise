class Category < ApplicationRecord
  has_many :words, dependent: :destroy  
  validates :description, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
end
