class CreateWtwos < ActiveRecord::Migration
  def change
    create_table :wtwos do |t|
      t.integer :user_id
      t.string :path
      t.integer :year

      t.timestamps
    end
    add_index :wtwos, [:user_id, :year]
  end
end
