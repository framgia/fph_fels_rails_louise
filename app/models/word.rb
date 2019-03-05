class Word < ApplicationRecord
  belongs_to :category
  has_many :choices , dependent: :destroy
  accepts_nested_attributes_for :choices
  default_scope -> { order(created_at: :desc) }
  # validates :category_id, presence: true
  validates :word, presence: true, length: { maximum: 15 }
  
  def answer_right
    choices.find_by(correct: true).try(:content)
  end
end 