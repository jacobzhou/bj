class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.text :description
      t.string :lx
      t.string :file
      t.references :attable
      t.string :attable_type

      t.timestamps
    end
    add_index :attachments, [:attable_id, :attable_type]
  end

  def self.down
    drop_table :settings
  end
end
