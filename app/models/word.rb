class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true,  reject_if: :all_blank
  validates :content, presence: true, length: { maximum: 50 }
  default_scope -> { order(created_at: :desc) }
 
  
  def correct_ans
    choices.find_by(correct: true).try(:content)
  end


end
