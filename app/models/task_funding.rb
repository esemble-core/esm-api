class TaskFunding < ApplicationRecord
  belongs_to :task

  validates_presence_of :token_address, :token_symbol, :amount, :token_name
end
