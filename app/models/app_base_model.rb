class AppBaseModel < ActiveRecord::Base
  self.abstract_class = true
    unless method_defined? :org_to_xml
      alias_method :org_to_xml, :to_xml
      def to_xml(options = {})
        #@val=session[:id]
      #proc = Proc.new { |options| options[:builder].tag!('session_id', @val) }
        options.merge!(:dasherize => false)
        #options.merge!(:procs => [ proc ])
        self[:session_data]="session_id::"+session[:session_id]+"^expires_at::"+session[:expires_at].to_s()
        #self.org_to_xml(:include=>{:id=>session[:id],:session_id=>session[:session_id]})
        org_to_xml(options)
     end
 end
end
class SessionData
  attr_accessor :id,:session_id
end
