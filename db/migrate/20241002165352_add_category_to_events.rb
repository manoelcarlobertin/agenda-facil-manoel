class AddCategoryToEvents < ActiveRecord::Migration[7.2]
  def change
    # troquei o null: false para null: true, porque já existe um evento com categoria nula;
    add_reference :events, :category, null: true, foreign_key: true
  end
end
