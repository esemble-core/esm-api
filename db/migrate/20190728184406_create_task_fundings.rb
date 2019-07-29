class CreateTaskFundings < ActiveRecord::Migration[5.2]
  def change
    create_table :task_fundings do |t|
      t.string :token_address
      t.string :token_symbol
      t.string :token_name
      t.decimal :amount
      t.references :task, foreign_key: true
      
      t.timestamps
    end
  end
end
