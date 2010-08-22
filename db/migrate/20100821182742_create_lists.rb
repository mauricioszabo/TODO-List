class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name
      t.boolean :public
      t.references :user

      t.timestamps
    end
    add_index :lists, :name
    add_index :lists, :public
  end

  def self.down
    drop_table :lists
  end
end
