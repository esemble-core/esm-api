class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name, :description, :funding, :lifecycle
  has_many :tasks
end