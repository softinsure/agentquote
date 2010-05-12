# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Userstamp
  around_filter :you_dont_have_bloody_clue
  #before_filter :login_required
  before_filter :session_expired
  #before_filter :set_current_user
  after_filter :flex_error_handling
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def session_expired
    @current_action = self.action_name
    @current_controller = self.controller_name
    return if @current_controller == 'sessions' && @current_action == 'create'
    if !session[:id].blank?
      @application_session = Session.find_by_id(session[:id])
    end
    current_user = self.current_user
    if session_expired_at.blank?
      @time_left=0
    else
#      logger.info "ApplicationController#session_expired_at#timeleft #{session_expired_at}"
#      logger.info "ApplicationController#time.zone.now #{Time.zone.now}"
      @time_left = (session_expired_at - Time.zone.now).to_i
    end
#    logger.info "ApplicationController#session_expired #{@time_left}"
    if @time_left<=0
      #reset_session
      #flash[:error] = 'Session Expired.'
#      logger.info "ApplicationController#session_expired #redirect_to #{@time_left}"
      if !session[:id].blank?
        Session.destroy(@application_session)
        session[:id] = nil
      end
      #Session.destroy(params[:id])
      logout_killing_session!
      respond_to do |format|
        format.html do
          flash[:notice] = "Your session has been expired!"
          redirect_back_or_default('/')
        end
        #format.fxml { render :text => "loggedout" }
        format.xml { render :text => "sessionexpired"}
      end
     #Session.destroy(@application_session);
      #render_component :controller => 'sessions', :action => 'destroy', :expired => true
 
      #return redirect_to :controller => 'sessions', :action => 'destroy'
    else
      reset_sessions
    end
  end
  protected
#    def set_current_user
#      logger.info "set_current_user"
#      current_user = self.current_user
#      if @application_session = Session.find_by_id(session[:id])
#        @application_session.update_attributes(
#          :expired_at=>session_expired_at
#        )
#       end
#    end
  #by default 30 miniutes from now
  def reset_sessions
      reset_session_expired_at
        @application_session.update_attributes(
          :expired_at=>session_expired_at
        )
  end
  def reset_session_expired_at
    session[:expires_at] = session_timeout.minutes.from_now
#    logger.info "ApplicationController#reset_session_expired_at #{session[:expires_at]}"
  end
  def session_expired_at
#    logger.info "ApplicationController#session_expired_at #{session[:expires_at]}"
    return session[:expires_at]
  end
  def session_timeout
    return 30
  end
  def you_dont_have_bloody_clue
    klasses = [ActiveRecord::Base, ActiveRecord::Base.class]
    methods = ["session", "cookies", "params", "request"]
    methods.each do |shenanigan|
      oops = instance_variable_get(:"@_#{shenanigan}")

      klasses.each do |klass|
        klass.send(:define_method, shenanigan, proc { oops })
      end
    end
    yield

    methods.each do |shenanigan|
      klasses.each do |klass|
        klass.send :remove_method, shenanigan
      end
    end
  end
end