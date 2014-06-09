# encoding: utf-8
class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.integer :catalog_id
      t.string :author
      t.text :quote
      t.text :content
      t.float :position, :default => 0.0
      t.boolean :published
      t.boolean :cat
      t.integer :top
      t.integer :user_id
      t.string :tag
      t.timestamps
    end

    add_index :articles, :catalog_id 
    add_index :articles, :user_id 
    add_index :articles, :published
    add_index :articles, :position 
    add_index :articles, :tag

  end



  def self.down
    drop_table :articles 
  end
end
