class CreateConfigXmls < ActiveRecord::Migration
  def self.up
    create_table :config_xmls do |t|
      t.string :name
      t.string :type
      t.string :lob
      t.string :used_for
      t.int :version
      t.string :active
      t.text :xmlstring
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :config_xmls
  end
end
