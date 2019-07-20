class TaskSerializer
  include FastJsonapi::ObjectSerializer

  attribute :id
  attribute :name
  attribute :done
end