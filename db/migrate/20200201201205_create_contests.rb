class CreateContests < ActiveRecord::Migration[5.2]
  def change
    create_table :contests do |t|
      t.string :code, null: false
      t.string :title, null: false
      t.text :description
      t.string :status, null: false
      t.integer :created_by

      t.timestamps

      t.index %i[code], unique: true
    end
  end
end
