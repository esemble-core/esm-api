class Lookup < ApplicationRecord
  def self.for (key)
    lookup = Lookup.where(key: key)
    lookup.first.value
  end
end