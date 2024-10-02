class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :indentifier, null: false
      t.string :name, limit: 150


      t.timestamps
    end
    add_index :categories, :indentifier, unique: true
  end
end
