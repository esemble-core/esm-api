class VerifiableTaskEvent < ApplicationRecord
  belongs_to :task
  has_many :task_event_verifications
  validates_presence_of :event_type


  def verifications
    task_event_verifications
  end

  def event_type_descr
    Lookup.for(event_type.to_s)
  end
end
