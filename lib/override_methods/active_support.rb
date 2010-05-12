module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc: 
    module Hash #:nodoc:
      module Conversions
        # We force :dasherize to be false, since we never want
        # it true.  Thanks very much to the reader on the
        # flexiblerails Google Group who suggested this better
        # approach.
        unless method_defined? :old_to_xml
          alias_method :old_to_xml, :to_xml
          def to_xml(options = {})
            options.merge!(:dasherize => false)
            old_to_xml(options)
          end
        end
      end
    end
    module Array #:nodoc:
        #def to_hash(options = {})
          #Hash[*self.map{ |m| [m.id, m]}.flatten]
          #options.merge!(:dasherize => false)
          #to_hash(options)
       #end
     module Conversions
        # We force :dasherize to be false, since we never want
        # it to be true.
        unless method_defined? :old_to_xml
          alias_method :old_to_xml, :to_xml
          def to_xml(options = {})
            options.merge!(:dasherize => false)
            old_to_xml(options)
          end
        end
      end
    end
  end      
end