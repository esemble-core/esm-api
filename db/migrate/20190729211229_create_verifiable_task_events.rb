class CreateVerifiableTaskEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :verifiable_task_events do |t|
      t.string :attachment_link_text
  
      t.references :task, foreign_key: true
      t.references :event_type, foreign_key: true
      
      t.timestamps
    end
  end
end

