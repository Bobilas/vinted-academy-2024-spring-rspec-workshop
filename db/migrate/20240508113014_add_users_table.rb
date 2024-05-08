class AddUsersTable < ActiveRecord::Migration[7.0]
  def up
    return if table_exists? :users

    create_table :users do |t|
      t.string :name, null: false, index: { unique: true }
      t.boolean :is_verified, null: false, default: false
      t.timestamps
    end
  end

  def down
    return unless table_exists? :users

    drop_table :users
  end
end
