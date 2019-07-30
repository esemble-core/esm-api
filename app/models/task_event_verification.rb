class TaskEventVerification < ApplicationRecord
  belongs_to :verifiable_task_event
  belongs_to :user
end
