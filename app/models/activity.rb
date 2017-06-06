class Activity < ApplicationRecord
  validates :name, presence: true

  # priority is an attribute invisible to the user

  def self.all_for_priority_asc
  	Activity.all.order(priority: :asc)
  end

  def self.all_for_priority_desc
  	Activity.all.order(priority: :desc)
  end

  def self.all_for_created_at_desc
  	Activity.all.order(created_at: :desc)
  end

  def increase_priority(priority)
    new_priority = priority - 1
    self.update(priority: new_priority)
  end

  def set_highest_priority
    lowest_priority = Activity.all_for_priority_asc.
                      select(:priority).first.priority
    increase_priority(lowest_priority)
  end

end
