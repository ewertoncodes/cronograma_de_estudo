class RemoveDefaultFromPriorityInActivities < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:activities, :priority, nil)
  end
end
