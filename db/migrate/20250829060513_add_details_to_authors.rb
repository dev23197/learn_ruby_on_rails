class AddDetailsToAuthors < ActiveRecord::Migration[8.0]
  def change
    add_column :authors, :author_number, :integer
    add_column :authors, :author_name, :string
  end
end
