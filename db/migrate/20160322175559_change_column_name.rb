class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :courses, :descriptiono, :description	  
  end
end
