class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :name, limit: 500
      t.text :description
      t.string :period, limit: 100
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
