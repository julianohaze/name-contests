class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :api_key

      t.timestamps

      t.index [:api_key], unique: true
    end
  end
end
