class CreateVerifiableTaskEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :verifiable_task_events do |t|
      t.string :attachment_link_text
      t.integer :event_type
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end


# lookup
# - event-type
# - lookup - name
# - lookup - description

#@articles = Article.where(brand_id: brand_ids).includes(:brand)

#t.index ["product_id"], name: "index_back_bars_on_product_id", using: :btree