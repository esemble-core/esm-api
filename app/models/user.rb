class User < ApplicationRecord
  has_and_belongs_to_many :tasks
  validates_presence_of :name, :eth_addr, :uuid, :email

 # before_save :default_values
  #def generate_uuid
  #  self.status ||= 'P' # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  #end

end
