class Choice < ApplicationRecord
  belongs_to :word
  validates :content, presence: true, length: { maximum: 50 }
  
end
