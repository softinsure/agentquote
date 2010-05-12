class Policy < ActiveRecord::Base
  has_one :quote,:class_name => 'Quote', :dependent => :destroy
  accepts_nested_attributes_for :quote, :allow_destroy => true
  stampable
  belongs_to :policy_header, :foreign_key => 'policy_header_id'
end
def before_create
     self.transaction_at = Date.today if self.transaction_at == nil
end  