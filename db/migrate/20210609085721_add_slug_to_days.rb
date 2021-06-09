class AddSlugToDays < ActiveRecord::Migration[6.0]
  def change
    add_column :days, :slug, :string
    add_index :days, :slug, unique: true
  end
end
