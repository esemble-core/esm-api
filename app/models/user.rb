class User < ApplicationRecord
  
  validates_presence_of :name, :eth_addr, :uuid
end
