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

  def increase_priority
    lower_priority = Activity.all_for_priority_asc.
                      select(:priority).first.priority
    self.update(priority: --lower_priority)
  end

end
