class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.integer :quote_id, :default => 0, :null => false
      t.binary  :document_data, :null => false
      t.string  :description
      t.string  :content_type
      t.string  :filename
      t.userstamps 
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
