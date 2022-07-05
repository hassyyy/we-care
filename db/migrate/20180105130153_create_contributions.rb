class CreateContributions < ActiveRecord::Migration[7.0]
  def change
    create_table :contributions do |t|
      t.integer :value
      t.string :month
      t.integer :year
      t.string :status
      t.string :mode
      t.integer :user_id

      t.timestamps
    end
    add_index :contributions, [:user_id, :created_at]
  end
end
