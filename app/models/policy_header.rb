class PolicyHeader < ActiveRecord::Base
  has_many :policy,:class_name => 'Policy', :dependent => :destroy
  accepts_nested_attributes_for :policy, :allow_destroy => true
  stampable
 end
