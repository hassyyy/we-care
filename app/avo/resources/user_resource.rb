class UserResource < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  field :name, as: :text, link_to_resource: true, required: true
  field :email, as: :text, required: true
  field :phone, as: :number, required: true
  field :account_admin, as: :boolean, hide_on: [:index]

  field :password, as: :password
  field :password_confirmation, as: :password

  field :contributions, as: :text, only_on: :show do |model, resource, view|
    total = model.contributions.where(status: 'sent').sum(:value)
    number_to_currency(total, AppOptions::CURRENCY_FORMAT)
  end


  field :contributions, as: :has_many
end
