class PolicyHeader < ActiveRecord::Base
  has_many :policy,:class_name => 'Policy', :dependent => :destroy
  accepts_nested_attributes_for :policy, :allow_destroy => true
  has_one :billing_info,:class_name => 'BillingInfo', :dependent => :destroy
  accepts_nested_attributes_for :billing_info, :allow_destroy => true
  stampable
 end
