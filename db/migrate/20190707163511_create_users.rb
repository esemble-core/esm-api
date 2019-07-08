class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :name
      t.string :eth_addr

      t.timestamps
    end
  end
end
