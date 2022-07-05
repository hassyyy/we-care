class ContributionResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  self.record_selector = false
  self.after_create_path = :index
  self.after_update_path = :index

  field :user_id, as: :hidden, only_on: :forms, name: 'Contributor', default: -> { context[:user].id }
  field :user, as: :belongs_to, hide_on: :forms

  field :value, as: :number, required: true, default: -> { context[:user].contributions.first&.value }

  field :month, as: :hidden, only_on: :forms, default: -> { Date.today.strftime("%b") }
  field :month, as: :text, hide_on: :forms

  field :year, as: :hidden, only_on: :forms, default: -> { Date.today.year }
  field :year, as: :number, hide_on: :forms

  field :status, as: :badge, options: { info: ['submitted'], success: 'sent' }
  field :status, as: :hidden, visible: -> (resource:) { !context[:user].account_admin? }, only_on: :forms, default: 'submitted'
  field :status, as: :select, visible: -> (resource:) { context[:user].account_admin? }, only_on: :forms, required: true, options: { 'Submitted': :submitted, 'Sent': :sent }, default: 'submitted'  
end
