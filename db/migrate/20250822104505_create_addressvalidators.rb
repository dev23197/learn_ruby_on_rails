class CreateAddressvalidators < ActiveRecord::Migration[8.0]
  def change
    create_table :addressvalidators do |t|
      t.timestamps
    end
  end
end
