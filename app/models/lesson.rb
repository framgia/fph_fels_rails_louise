class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers, dependent: :destroy
  has_many :choices, through: :answers, dependent: :destroy

  def get_correct
  	self.choices.where(correct: true)
  end
end
