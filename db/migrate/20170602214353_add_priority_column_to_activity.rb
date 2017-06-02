class AddPriorityColumnToActivity < ActiveRecord::Migration[5.0]
  def change
  	add_column :activities, :priority, :integer, null: false, default: 99
  	Activity.update_all(priority: 99)
  end
end
