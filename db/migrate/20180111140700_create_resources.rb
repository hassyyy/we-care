class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :address
      t.string :contact_details
      t.string :other_details

      t.timestamps
    end
  end
end
