namespace :base_data do
  desc "Create base data"

  task create: :environment do
    puts "creating base data..."
    puts "-creating EventTypes-"
    EventType.create(name: "Design Submission", description: "It is generally expected that before you work on your task you submit a Design for the community to review and provide you suggestion on. This will also confirm the funding for the task.")
    EventType.create(name: "Task Submission", description: "Submit a link to the completed task for the community to review.")
    EventType.create(name: "Task Completion", description: "Mark this task as complete for the community to review.")
    puts "...done"
  end
end




