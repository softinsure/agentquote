class Agency < ActiveRecord::Base
  validates_presence_of :name
   attr_accessible :name, :contact_title, :contact_first_name, :contact_middle_name, :contact_last_name,
   :address, :address2, :city, :state, :zip, :contact_email, :contact_phone1, :contact_phone2, :fax, 
   :license_number, :license_type, :agency_code
  stampable
end
