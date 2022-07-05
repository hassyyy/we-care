class AddInternalToResource < ActiveRecord::Migration[7.0]
  def change
    add_column :resources, :internal, :boolean
  end
end
