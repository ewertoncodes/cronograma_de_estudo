class Activity < ApplicationRecord

  before_save :assign_priority, if: :first_time?

  validates :name, presence: true

  # priority is an attribute invisible to the user

  # TODO: Será que pode copiar o valor do id para priority ?
  # Assim que salvasse (after_save), pegava o id, atribuía e dava um update
  # no objeto
  def assign_priority
    self.priority = biggest_priority + 1
  end

  def first_time?
    self.id.nil?
  end

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
    activity_bigger_priority = Activity.where("priority < ?", self.priority).take

    unless activity_bigger_priority.nil?
      high_priority = activity_bigger_priority.priority
      puts "high priority " +  high_priority.to_s
      lower_priority = self.priority
      puts "lower priority " + lower_priority.to_s
      activity_bigger_priority.update(priority: lower_priority)
      self.update(priority: high_priority)
    end
  end

  def set_highest_priority
    lowest_priority = Activity.all_for_priority_asc.
                      select(:priority).first.priority
    increase_priority(lowest_priority)
  end


  private

    def biggest_priority
      activities = Activity.all_for_priority_desc
      if not activities.empty?
        activities.select(:priority).first.priority
      else
        -1
      end
    end


end
