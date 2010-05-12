class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :quote_id
      t.string :payment_plan
      t.string :down_payment_type
      t.string :bill_type
      t.float :min_down
      t.float :installment
      t.float :total_charge
      t.float :agency_fee
      t.float :policy_fee
      t.float :misc_fee
      t.string :misc_fee_reason

      t.userstamps 
    	t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
