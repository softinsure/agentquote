class Agent < ActiveRecord::Base
  validates_presence_of :agent_code
   attr_accessible :agent_code, :agency_code, :first_name, :middle_name, :last_name,
   :address, :address2, :city, :state, :zip, :email, :work_phone, :cell_phone, :ssn,
   :license_number, :license_type
   stampable 
end
