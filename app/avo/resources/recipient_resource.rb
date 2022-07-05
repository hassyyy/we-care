class RecipientResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.model_class = ::Resource
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  field :name, as: :text, link_to_resource: true, required: true
  field :address, as: :trix, required: true, always_show: true
  field :contact_details, as: :number, required: true, name: 'Phone'
  field :other_details, as: :trix, required: true, always_show: true
  field :internal, as: :boolean, hide_on: [:index, :edit]

  field :donations, as: :has_many
end
