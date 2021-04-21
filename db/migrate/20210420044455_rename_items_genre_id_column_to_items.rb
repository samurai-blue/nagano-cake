class RenameItemsGenreIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :items_genre_id, :genre_id
  end
end
