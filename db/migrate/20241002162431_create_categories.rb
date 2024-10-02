class CreateCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :categories do |t|
      t.string :indentifier, null: false
      t.string :name, limit: 150


      t.timestamps
    end
    # Add unique index to the identifier column, pssing the table name and column name as arguments;
    # The unique: true option ensures that don't two records can have the same identifier;
    # I can also use more than one column in the index by passing [ an array ] of column names;
    add_index :categories, [ :indentifier ], unique: true
  end
end
