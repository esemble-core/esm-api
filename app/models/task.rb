class Task < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :project

  validates_presence_of :name
end
