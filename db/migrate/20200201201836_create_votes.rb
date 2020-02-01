class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.references :name, foreign_key: true, index: true
      t.boolean :up
      t.integer :created_by

      t.timestamps

      t.index %i[name_id created_by], unique: true
    end
  end
end
