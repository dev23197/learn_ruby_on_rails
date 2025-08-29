class CreateManifests < ActiveRecord::Migration[8.0]
  def change
    create_table :manifests do |t|
      t.timestamps
    end
  end
end
