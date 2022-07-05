class AddAccountAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account_admin, :boolean, default: false
  end
end
