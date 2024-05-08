class AddItemsTable < ActiveRecord::Migration[7.0]
  def up
    return if table_exists? :items

    create_table :items do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.numeric :price, null: false
      t.boolean :is_sold, null: false, default: false
      t.boolean :is_nsfw, null: false, default: false
      t.timestamps
    end
  end

  def down
    return unless table_exists? :items

    drop_table :items
  end
end
