class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers, dependent: :destroy
  has_many :choices, through: :answers, dependent: :destroy
  has_one :activity, as: :action, dependent: :destroy
  after_save :get_activity

  def get_correct
  	self.choices.where(correct: true)
  end
  
  def get_activity
    create_activity(user_id: user.id) if score.present? 
  end
end
