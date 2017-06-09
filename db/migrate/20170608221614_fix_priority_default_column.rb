class FixPriorityDefaultColumn < ActiveRecord::Migration[5.0]
  def change
  	change_column :activities, :priority, :integer, null: true
  	add_index :activities, :priority, :unique => true
  end
end
