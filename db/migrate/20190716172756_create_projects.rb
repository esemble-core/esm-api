class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :lifecycle
      t.string :name
      t.string :description
      t.integer :funding
      #users
      #tasks
      t.timestamps
    end
  end
end
