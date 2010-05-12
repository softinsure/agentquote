class CreatePolicies < ActiveRecord::Migration
  def self.up
    create_table :policies do |t|
      t.string :policy_prefix
      t.string :policy_suffix
      t.string :policy_number
      t.string :prior_policy_number
      t.datetime :org_effective_date
      t.string :current_status
      t.integer :num_endorsed
      t.integer :num_renewed
      t.integer :num_reinstated
      t.integer :quote_id
      t.number :ref_number
      t.userstamps
      t.timestamps
    end
  end

  def self.down
    drop_table :policies
  end
end
