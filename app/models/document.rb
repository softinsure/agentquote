class Document < ActiveRecord::Base
  belongs_to :quote
    stampable
    #before_create:read_document

  def read_document(input_data) 
  #debugger
  data = if input_data.respond_to?(:rewind)
         input_data.rewind
         input_data.read
      else
         input_data
      end
    
    #self.filename = input_data.original_filename 
    #self.content_type = input_data.content_type.chomp 
    self.document_data = data.document_data
  end
end
