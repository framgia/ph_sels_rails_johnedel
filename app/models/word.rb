class Word < ApplicationRecord
  belongs_to :category
  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true,  reject_if: :all_blank
  validates :content, length: { maximum: 50 }
  validates_presence_of :content, message: "word can't be blank"
  default_scope -> { order(created_at: :desc) }
  validate :one_choice_only
  validate :must_unique
  has_many :answers, dependent: :destroy
  has_many :lessons, through: :answers  
 
  def correct_ans
    choices.find_by(correct: true).try(:content)
  end

  def one_choice_only
    answer = choices.collect { |choice| choice.correct}.count(true)
    unless answer == 1
      return errors.add(:base, "Please check only one correct answer")
    end
  end

  def must_unique
    uniqLength = choices.uniq { |choice| choice.content.downcase }.count
    if uniqLength < choices.length
      return errors.add(:base, "Duplication of choices, it must be unique")
    end
  end
end
