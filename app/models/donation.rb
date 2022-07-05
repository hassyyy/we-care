class Donation < ApplicationRecord
  belongs_to :resource
  default_scope { order(created_at: :desc) }

  validates :resource_id, presence: true
  validates :value, presence: true,
                    numericality: {
                                    only_integer: true,
                                    greater_than: 0,
                                    less_than_or_equal_to: 50000
                                  }
  validates :description, presence: true
  validates :date, presence: true
end
