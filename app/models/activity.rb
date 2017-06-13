class Activity < ApplicationRecord

  before_save :assign_priority, if: :first_time?

  validates :name, presence: true

  UP_PRIORITY = "up"
  DOWN_PRIORITY = "down"


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

  def change_priority(kind)
    unless kind != UP_PRIORITY and kind != DOWN_PRIORITY
      
      if kind == UP_PRIORITY
        activity_database = Activity.order(priority: :desc).
          where("priority < ?", self.priority).first
      elsif kind == DOWN_PRIORITY
        activity_database = Activity.order(priority: :asc).
          where("priority > ?", self.priority).first
      end

      unless activity_database.nil?
        priority_database = activity_database.priority
        object_priority = self.priority

        Activity.transaction do
          activity_database.update(priority: -1)
          self.update(priority: priority_database)
          activity_database.update(priority: object_priority)
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
