class ChangeTableSubscription < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :user_id
    add_reference :subscriptions, :participant, references: :users, index: true, foreign_key: true
  end
end
