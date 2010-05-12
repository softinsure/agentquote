module ActiveRecordExtensions
  module Base
    def self.included(base)
      base.class_eval do
        alias_method_chain :to_xml, :customized
      end
    end

    def to_xml_with_customized(options = {})
      # protect attributes registered with attr_protected
      options.merge!({'session_id'=>1})
      logger.info "to_xmlcust #{options}"
      to_xml_without_customized(options)
    end
  end
end