class Task < ApplicationRecord
  has_and_belongs_to_many :users, -> { distinct }
  belongs_to :project

  validates_presence_of :name
end
