require 'action_controller_extra/extra_methods'
require 'common_utils/common_methods'
require 'authenticated_system'

ActionController::Base.class_eval do
  #include Userstamp
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  include ActionControllerExtra::ExtraMethods
  include CommonMethods
  #include protect_from_forgery
end
ActiveRecord::Base.class_eval do
  include CommonMethods
  #include protect_from_forgery
end