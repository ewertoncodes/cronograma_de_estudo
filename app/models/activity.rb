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
    activity_bigger_priority = Activity.order(priority: :desc).
      where("priority < ?", self.priority).first

    unless activity_bigger_priority.nil?
      high_priority = activity_bigger_priority.priority
      lower_priority = self.priority

      Activity.transaction do
        activity_bigger_priority.update(priority: -1)
        self.update(priority: high_priority)
        activity_bigger_priority.update(priority: lower_priority)
      end
    end
  end

  def decrease_priority
    high_priority = self.priority

    activity_low_priority = Activity.order(priority: :asc).
      where("priority > ?", high_priority).first

    unless activity_low_priority.nil? && ac
      low_priority = activity_low_priority.priority

      Activity.transaction do
        self.update(priority: -1)
        activity_low_priority.update(priority: -2)
        Activity.transaction do
          activity_low_priority.update(priority: high_priority)
          self.update(priority: low_priority)
        end
      end

    end

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
