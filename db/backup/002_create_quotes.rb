class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.string :quote_type, :limit => 10, :default => 'NEW'
      t.string :lob, :null => false, :limit => 10
      t.string :policy_type, :limit => 10
      t.string :quote_status, :limit => 1, :default => 'Q'
      t.integer :policy_term, :limit => 2
      t.date :quote_effective_date
      t.date :quote_expiration_date
      t.date :policy_effective_date
      t.date :policy_expiration_date
      t.integer :version, :limit=>3
      t.boolean :rated
      t.datetime :last_rated_at
      t.boolean :produced
      t.datetime :produced_at
      t.float :quoted_premium
      t.string :transaction_name, :null => false, :limit => 50
      t.string :search_name, :limit => 50
      t.timestamps
      t.userstamps 
    end
  end
  
  def self.down
    drop_table :quotes
  end
end
