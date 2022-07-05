class RemoveMeetings < ActiveRecord::Migration[7.0]
  def change
    drop_table :meetings
    drop_table :user_meeting_statuses
  end
end
