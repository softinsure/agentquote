class CreateXmlstores < ActiveRecord::Migration
  def self.up
    create_table :xmlstores do |t|
      t.integer :quote_id, :default => 0, :null => false
      t.text :xmlstring
      t.text :original_xml
      t.text :xml_menu
      t.timestamps
      t.userstamps 
    end
  end

  def self.down
    drop_table :xmlstores
  end
end
