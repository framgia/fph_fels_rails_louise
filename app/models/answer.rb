class Answer < ApplicationRecord
  belongs_to :word
  belongs_to :lesson
  belongs_to :choice, optional: true  
  
end
