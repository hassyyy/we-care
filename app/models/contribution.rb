class Contribution < ApplicationRecord
  belongs_to :user
  default_scope { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :value, presence: true,
                    numericality: {
                                    only_integer: true,
                                    greater_than: 0,
                                    less_than_or_equal_to: 50000
                                  }
  validates :year, presence: true,
                    numericality: {
                                    only_integer: true,
                                    greater_than: 2016,
                                    lesser_than: Date.today.year
                                  }
  validates :month, presence: true,
                    inclusion: { in: Date::ABBR_MONTHNAMES[1..12] }

  validates :status, presence: true,
                     inclusion: { in: ["submitted", "sent"] }

  validates_uniqueness_of :user_id, scope: [:month, :year], message: 'already made a contribution for the selected month & year'

end
