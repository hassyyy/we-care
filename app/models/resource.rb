class Resource < ApplicationRecord
  has_many :donations, dependent: :destroy

  default_scope { order(name: :asc) }

  validates :name, presence: true
  validate :presence_of_address_or_contact
  validates :contact_details, length: { maximum: 15, message: "cannot exceed 15 digits" },
                              numericality: { only_integer: true }

  private
    def presence_of_address_or_contact
      if address.blank? && contact_details.blank?
        errors[:base] << "Both address and contact details cannot be blank. Specify at least one"
      end
    end
end
