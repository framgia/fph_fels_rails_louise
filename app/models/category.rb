class Category < ApplicationRecord
  has_many :words, dependent: :destroy 
  has_many :lessons, dependent: :destroy
  validates :description, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  
  def self.has_words
    Category.where(:id => Word.select(:category_id).map(&:category_id))
  end
end

