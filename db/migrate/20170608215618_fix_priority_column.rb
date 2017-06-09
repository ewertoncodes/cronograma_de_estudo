class FixPriorityColumn < ActiveRecord::Migration[5.0]
  def change
  	activities = Activity.all.order(priority: :asc)
  	priority = 0
  	activities.each do |activity|
      activity.update_attributes!(priority: priority)
      priority = priority + 1
  	end
  end
end
