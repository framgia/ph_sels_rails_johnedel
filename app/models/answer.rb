class Answer < ApplicationRecord
  belongs_to :lesson
  belongs_to :word
  belongs_to :choice
end
