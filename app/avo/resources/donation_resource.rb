class DonationResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  field :resource, as: :belongs_to, required: true, name: 'Recipient'
  field :value, as: :number, required: true
  field :description, as: :trix, required: true, always_show: true
  field :date, as: :date, required: true, picker_format: 'd F, Y', format: '%d %B, %Y', default: Date.today, disable_mobile: true
end
