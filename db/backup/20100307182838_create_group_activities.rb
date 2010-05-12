class CreateGroupActivities < ActiveRecord::Migration
  def self.up
    create_table :group_activities do |t|
      t.string :activity_code
      t.string :description
      t.string :status
      t.userstamps
      t.timestamps

    end
  end

  def self.down
    drop_table :group_activities
  end
end
