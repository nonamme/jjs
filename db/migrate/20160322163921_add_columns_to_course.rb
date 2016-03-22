class AddColumnsToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :subtitle, :string
    add_column :courses, :descriptiono, :text 
    add_column :courses, :contact_info, :text 
    add_column :courses, :estimated_finish_time, :float
    add_column :courses, :is_published, :boolean, default: false
    add_reference :courses, :owner, references: :users, index: true, foreign_key: true
  end
end
