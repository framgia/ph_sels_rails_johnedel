class Category < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 150 }
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy

end