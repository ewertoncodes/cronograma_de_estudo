class Activity < ApplicationRecord
  validates :name, presence: true

  def self.all_for_priority_asc
  	Activity.all.order(priority: :asc)
  end

  def self.all_for_priority_desc
  	Activity.all.order(priority: :desc)
  end

  def self.all_for_created_at_desc
  	Activity.all.order(created_at: :desc)
  end

end
