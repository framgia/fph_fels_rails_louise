class Lesson < ApplicationRecord
  after_save :store_activity
  belongs_to :user
  belongs_to :category
  
  has_many :answers, dependent: :destroy
  has_many :words, through: :answers, dependent: :destroy
  has_many :choices, through: :answers, dependent: :destroy
  has_one :activity, as: :action, dependent: :destroy

  def get_correct
  	self.choices.where(correct: true)
  end

  private
    def store_activity
      create_activity(user_id: user.id) if score? 
    end
end
