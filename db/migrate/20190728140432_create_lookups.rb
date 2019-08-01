class CreateLookups < ActiveRecord::Migration[5.2]
  def change
    create_table :lookups do |t|
      t.string :key, :unique => true
      t.string :value
      t.string :entity
      t.index :key
    end
  end
end
