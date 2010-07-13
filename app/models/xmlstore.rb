class Xmlstore < ActiveRecord::Base
  belongs_to :quote, :foreign_key => 'quote_id'
  stampable
  #attr_accessible :xmlstring, :menu_xml
  before_create:acord_file
  before_update:decode_string
  after_update:encode_string
  after_create:encode_string
    
  #before_render:wrap_xml
 def decode_string
    self.xmlstring=base64Decode(self.xmlstring)
    self.menu_xml=base64Decode(self.menu_xml)
    self.original_xml=base64Decode(self.original_xml)
    self.payment_schedule=base64Decode(self.payment_schedule)
    self.change_detail=base64Decode(self.change_detail)
    #base64decode(self.original_xml)
 end
 def encode_string
    self.xmlstring=base64Encode(self.xmlstring)
    self.menu_xml=base64Encode(self.menu_xml)
    self.original_xml=base64Encode(self.original_xml)
    self.payment_schedule=base64Encode(self.payment_schedule)
    self.change_detail=base64Encode(self.change_detail)
    #base64decode(self.original_xml)
 end
 def decode_string1
      self.xmlstring = self.xmlstring.gsub(/\r\n|\n|\r|\xEF\xBB\xBF/,"");
      rescue => e
        file_error(e);
  end
  def acord_file
  	  parent_quote=self.quote
  	  if !parent_quote
  	  	#get from object space
  	  	ObjectSpace.each_object(Quote) {|o| parent_quote = o if o.xmlstore.include?(self)}
  	  end
  	  if parent_quote
  	  	self.xmlstring = Xmlstore.get_acord_file(parent_quote.lob) if self.xmlstring == nil;
  	  end
      #read file from directory
      #filename=RAILS_ROOT+"/app/flex/xmlstores/acord/request_pa.xml";
      #filename=RAILS_ROOT+"/app/xmlstores/acord/request_pa.xml";
      #f=File.new(filename,"r");
      #self.xmlstring = f.gets.chomp;
      #self.xmlstring = (File.open(filename).read).gsub(/\r\n|\n|\r|\xEF\xBB\xBF/,"");
      #self.xmlstring = Xmlstore.get_acord_file;
      #stripping \n, \r
      #self.xmlstring=self.xmlstring.gsub(/\r\n|\n|\r/,"");
      rescue => e
        file_error(e);
      #file.li
      #end 
      #self.xmlstring = get_file_content(filename);
  end
  def self.get_acord_file(lob)
      #read file from directory
      #filename=RAILS_ROOT+"/app/flex/xmlstores/acord/request_pa.xml";
      filename=RAILS_ROOT+"/app/xmlstores/acord/"+lob+".xml";
      return (File.open(filename.downcase).read).gsub(/\r\n|\n|\r|\xEF\xBB\xBF/,"");
      rescue => e
        file_error(e);
  end
  
  def get_file_as_string(filename)
    data = ''
    f = File.open(filename, "r") 
    f.each_line do |line|
      data += line
    end
    f.close
    return data
  end

  def get_file_content(filename)
    data = ''
    File.open((filename), "r") do |infile|
      while (line = infile.gets)
        data += line
      end
    end
    return data
    rescue => e
      file_error(e);
  end
  def file_error(e)
    logger.info "Xmlstore#file_error: #{e}"
  end
end
