class CreateErrorLogs < ActiveRecord::Migration
  def self.up
    create_table :error_logs do |t|
      t.integer :quote_id
      t.string :error_desc, :limit => 2000
      t.string :error_name, :limit => 100
      t.string :error_source, :limit => 1000
      t.string :error_type, :limit => 100
      t.timestamps
      t.userstamps 
      end
  end

  def self.down
    drop_table :error_logs
  end
end
