class CreateHandles < ActiveRecord::Migration[8.0]
  def change
    create_table :handles do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps
    end
  end
end
