class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :group_code
      t.string :description
      t.string :status
      t.string :editable
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
