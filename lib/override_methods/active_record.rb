module ActiveRecord #:nodoc:
  module Serialization
    # We force :dasherize to be false, since we never want it to
    # be true.
    unless method_defined? :old_to_xml
      alias_method :old_to_xml, :to_xml
      def to_xml(options = {})
       options.merge!(:dasherize => false)
       self[:session_data]="session_id::"+session[:session_id]+"^expires_at::"+session[:expires_at].to_s()
       old_to_xml(options)
     end
    end
  end
  module ActiveRecordHashing
    def to_hash
        Hash[*self.map{ |m| [m.id, m]}.flatten]               
    end
  end

  class Errors #:nodoc:
    def to_xml_full(options={})
      options[:root] ||= "errors"
      options[:indent] ||= 2
      options[:builder] ||=
      Builder::XmlMarkup.new(:indent => options[:indent])
      options[:builder].instruct! unless
      options.delete(:skip_instruct)
      options[:builder].errors do |e|
        # The @errors instance variable is a Hash inside the
        # Errors class
        @errors.each_key do |attr|
          @errors[attr].each do |msg|
            next if msg.nil?
            if attr == "base"
              options[:builder].error("message"=>msg)
            else
              fullmsg = @base.class.human_attribute_name(attr) +" " + msg
              options[:builder].error("field"=>attr, "message"=>fullmsg)
            end
          end
        end
      end
    end
  end
end
