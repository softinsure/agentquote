class CreateSearchEntities < ActiveRecord::Migration
  def self.up
    create_table :search_entities do |t|
      t.string :insured_name , :limit => 45
      t.string :entity1, :limit => 20
      t.string :entity2, :limit => 20
      t.string :entity3, :limit => 20
      t.string :entity4, :limit => 20
      t.string :entity5, :limit => 20
      t.string :entity6, :limit => 20
      t.string :entity7, :limit => 20
      t.string :entity8, :limit => 20
      t.string :entity9, :limit => 20
      t.string :entity10, :limit => 20

      t.timestamps
      t.userstamps
    end
  end

  def self.down
    drop_table :search_entities
  end
end
