class User < ApplicationRecord
  
  validates_presence_of :name, :eth_addr, :uuid

 # before_save :default_values
  #def generate_uuid
  #  self.status ||= 'P' # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  #end

end
