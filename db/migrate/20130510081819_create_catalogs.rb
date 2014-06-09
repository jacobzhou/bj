# encoding: utf-8
class CreateCatalogs < ActiveRecord::Migration
  def self.up
  	create_table :catalogs do |t|
      t.string :name
      t.text :desc
      t.string :ancestry
      t.float :position, :default => 0.0
      t.integer :articles_count
      t.integer :lx_id
      t.timestamps
    end

    add_index :catalogs, :ancestry 
  end

  def self.down
  	drop_table :catalogs
  end
end
