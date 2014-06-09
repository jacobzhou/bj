# encoding: utf-8
class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|   
      t.string :alt
      t.string :link
      t.string :title
      t.string :place
      t.float :position, :default => 0.0
      t.timestamps
    end

    add_attachment :pictures, :file
  end

  def self.down
    drop_table :pictures
  end
end
