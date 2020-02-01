class CreateNames < ActiveRecord::Migration[5.2]
  def change
    create_table :names do |t|
      t.references :contest, foreign_key: true, index: true
      t.string :label
      t.text :normalized_label, null: false
      t.string :description
      t.integer :created_by, null: false

      t.timestamps

      t.index %i[contest_id normalized_label], unique: true
    end
  end
end
