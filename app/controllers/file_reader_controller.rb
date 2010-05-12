class FileReaderController < ApplicationController
  require 'xmlsimple'
  def read
      @config_file_path =params[:file_reader][:file_path]
      @data = read_file(filepath)    
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => {"rows"=>@data}}
     end
  end
  def configloader_test
      @file_path ='xmlstores/config/xmlstoload.xml'
      @hash= [];
      read_xml(@file_path,'xml')['xml'].each do |key|
        @hash.push({"fileid"=>key['id'],"content"=>base64Encode(read_config_file(key['filepath']))})
      end
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hash}
     end
  end
  def configloader
      @file_path =params[:file_reader][:file_path]
      @hash= [];
      read_xml(@file_path,'xml')['xml'].each do |key|
        @hash.push({"fileid"=>key['id'],"content"=>base64Encode(read_config_file(key['filepath']))})
      end
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hash}
     end
  end
  def read_xml(filepath,key)
      #read file from directory
      #filename=RAILS_ROOT+"/app/flex/"+filepath;
      filename=RAILS_ROOT+"/app/"+filepath;
      return XmlSimple.xml_in(filename,{ 'KeyAttr' => key})
      rescue => e
        file_error(e);
  end
  private
  def read_config_file(filepath)
      #read file from directory
      #filename=RAILS_ROOT+"/app/flex/"+filepath;
      filename=RAILS_ROOT+"/app/"+filepath;
      return (File.open(filename).read);
      #return (File.open(filename).read).gsub(/\r\n|\n|\t|\r|\xEF\xBB\xBF/,"");
      rescue => e
        file_error(e);
  end
  def file_error(e)
    logger.info "FileReader#file_error: #{e}"
  end
end
