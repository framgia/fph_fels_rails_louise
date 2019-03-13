class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  belongs_to :voter, polymorphic: true
end
