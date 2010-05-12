class CreateGroupPermissions < ActiveRecord::Migration
  def self.up
    create_table :group_permissions do |t|
      t.string :group_code
      t.string :activity_code
      t.string :lob_code
      t.string :status
      t.string :editable
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :group_permissions
  end
end
