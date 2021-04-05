class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :name
      t.references :recipe, null: true, foreign_key: true

      t.timestamps
    end
  end
end
