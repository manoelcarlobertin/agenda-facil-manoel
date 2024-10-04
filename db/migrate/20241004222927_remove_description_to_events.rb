class RemoveDescriptionToEvents < ActiveRecord::Migration[7.2]
  def change
    remove_column :events, :description, :text
  end
end
