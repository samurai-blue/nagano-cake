class RenameItemsIdColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :items_id, :item_id
  end
end
