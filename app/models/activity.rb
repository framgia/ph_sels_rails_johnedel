class Activity < ApplicationRecord
  belongs_to :user 
  belongs_to :action, polymorphic: true, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
end
