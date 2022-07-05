class RemoveBillsFromDonations < ActiveRecord::Migration[7.0]
  def up
    remove_column :donations, :bills
  end

  def down
    add_column :donations, :bills, :string
  end
end
