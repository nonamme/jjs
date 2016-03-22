class ChangeJoinTableNameToProgress < ActiveRecord::Migration
  def change
    rename_table :chapters_users, :progress
  end
end
