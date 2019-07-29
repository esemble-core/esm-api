class CreateTaskEventVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :task_event_verifications do |t|
      t.references :verifiable_task_event, foreign_key: true
      t.references :user, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
