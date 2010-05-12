class CreateLineOfBusinesses < ActiveRecord::Migration
  def self.up
    create_table :line_of_businesses do |t|
      t.string :lob_code
      t.string :description
      t.string :status
      t.String :editable
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :line_of_businesses
  end
end
