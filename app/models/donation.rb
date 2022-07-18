class Donation < ApplicationRecord
  belongs_to :resource
  default_scope { order(created_at: :desc) }

  validates :resource_id, presence: true
  validates :value, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
