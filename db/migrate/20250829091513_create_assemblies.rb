class CreateAssemblies < ActiveRecord::Migration[8.0]
  def change
    create_table :assemblies do |t|
      t.timestamps
    end
  end
end
