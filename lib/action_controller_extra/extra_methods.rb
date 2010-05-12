module ActionControllerExtra
   module ExtraMethods
     # add all extended methods here
     #
     #   MyController < ApplicationController
     #     extended_methods
     #   end

    def prevent2_access(e,source)
        logger.info "#{source}Controller#prevent_access: #{e}"
        respond_to do |format|
        format.html { redirect_to(tasks_url) }
        #format.xml  { render :text => "controller" }
        format.xml  { render :xml => {:error=>e,:source=>"#prevent_access: #{source}"}}
    
        #format.xml  { render :xml => controller.errors, :status => :e}
      end
    end
    def flex_error_handling
      valid_status_codes = [201, 422].collect{|code| interpret_status(code)}
      if request.headers.has_key?('HTTP_X_FLASH_VERSION') && valid_status_codes.include?(response.headers['Status'])
        response.headers['Status'] = interpret_status(200)
      end
    end
   end
end