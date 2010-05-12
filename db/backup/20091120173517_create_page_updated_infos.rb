class CreatePageUpdatedInfos < ActiveRecord::Migration
  def self.up
    create_table :page_updated_infos do |t|
      t.integer :quote_id
      t.string :pageid
      t.boolean :required_fields_entered
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :page_updated_infos
  end
end
