class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name
      t.string :image_id
      t.text :description
      t.integer :price
      t.integer :items_genre_id
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :is_saled

      t.timestamps
    end
  end
end
