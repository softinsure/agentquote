class BillingInfo < ActiveRecord::Base
  stampable
  belongs_to :policy_header, :foreign_key => 'policy_header_id'
  before_create:decode_string
  before_update:decode_string
  after_update:encode_string
  after_create:encode_string

 def decode_string
    self.payment_schedule=base64Decode(self.payment_schedule)
 end
 def encode_string
    self.payment_schedule=base64Encode(self.payment_schedule)
 end
end