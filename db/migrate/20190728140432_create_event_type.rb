class CreateEventType < ActiveRecord::Migration[5.2]
  def change
    create_table :event_types do |t|
      t.string :name, :unique => true
      t.string :description
    end
  end
end
