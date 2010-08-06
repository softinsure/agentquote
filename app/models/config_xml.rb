class ConfigXml < ActiveRecord::Base
  stampable
  #attr_accessible :xmlstring, :menu_xml
  before_create:decode_string
  before_update:decode_string
  after_update:encode_string
  after_create:encode_string

  def decode_string
    if self.version.nil?
      self.version = 0
    end
    self.version=self.version+1;
    #self.xmlstring=base64Decode(self.xmlstring)
 end  
 def encode_string
    #self.xmlstring=base64Encode(self.xmlstring)
 end


end