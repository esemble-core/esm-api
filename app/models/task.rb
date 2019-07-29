class Task < ApplicationRecord
  has_and_belongs_to_many :users, -> { distinct }
  belongs_to :project
  has_many :task_fundings, dependent: :destroy
  has_many :verifiable_task_events, dependent: :destroy

  validates_presence_of :name
end
