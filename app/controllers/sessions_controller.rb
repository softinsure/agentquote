# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  skip_before_filter :login_required, :only => :create
  #before_filter :login_required, :only => :destroy

  # render new.rhtml
  def new
    @session = Session.new
  end

  def create
    logout_keeping_session!
    @session = Session.new(params[:session])
    reset_session_expired_at
    @session.expired_at=session_expired_at
    @session.session_timeout=session_timeout
    if @session.save
      session[:id] = @session.id
      @user=@session.user
      self.current_user = @user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      #new_cookie_flag = (params[:remember_me] == "1")
      new_cookie_flag = (@session[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      @agent = Agent.find_by_agent_code(@user.agent_code)
      @agency = Agency.find_by_agency_code(@agent.agency_code)
      @permissions = permissions(@user.group)
                
      respond_to do |format|
        format.html do
          redirect_back_or_default('/')
          flash[:notice] = "Logged in successfully"
        end
        #format.fxml  { render :xml => self.current_user.to_fxml }
        #format.xml  { render :xml => self.current_user.to_xml }
        format.xml  { render :xml => {:session=>@session, :user=>self.current_user,:agent=>@agent,:agency=>@agency, :permissions=>@permissions}}
        #format.xml  { render :xml => {:quote=>@quote,:search_entities=>@search_entities,:xmlstore=>@xmlstore}, :status => :created, :location => @quote }
        #format.fxml do
        #  render :fxml => user.user.to_fxml(:methods => :photo, 
        #    :include => {:address => {}, :user => {:only => [:id, :login, :email, :name], 
        #      :methods => [:photo_url]}})
        #end
      end
    else
      note_failed_signin
      respond_to do |format|
        format.html do
          @login       = params[:login]
          @remember_me = params[:remember_me]
          render :action => 'new'        
        end
        #format.fxml { render :text => "login_failed" }
        format.xml { render :text => "badlogin" }
      end
    end
  end

  def destroy
    if !session[:id].blank?
      #Session.destroy(Session.find_by_id(session[:id]))
      Session.destroy(@application_session.id)
      session[:id] = nil
    end
    #@session = Session.find(params[:id])
    #@session.destroy
#    Session.destroy(@application_session)
#    session[:id] = nil
    #Session.destroy(params[:id])
    logout_killing_session!
    respond_to do |format|
      format.html do
        flash[:notice] = "You have been logged out."
        redirect_back_or_default('/')
      end
      #format.fxml { render :text => "loggedout" }
      format.xml { render :text => "loggedout"}
    end
  end
  def release
    #Session.find_by_id(session[:id]).update_attributes(
    @application_session.update_attributes(
      :expired_at=>session_expired_at,
      :quote_use_mode=>nil,
      :qoute_in_use=>nil)
    respond_to do |format|
      format.html do
        flash[:notice] = "Quote has been released."
        redirect_back_or_default('/')
      end
      #format.fxml { render :text => "loggedout" }
      format.xml { render :text => "quotelreleased"}
      end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end
  def reset
    #reset_sessions
    respond_to do |format|
      format.html do
        flash[:notice] = "Session has been released."
        redirect_back_or_default('/')
      end
        format.xml { render :text => "sessionreset"}
      end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end
protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Couldn't log you in as '#{params[:login]}'"
    logger.warn "Failed login for '#{params[:login]}' from #{request.remote_ip} at #{Time.now.utc}"
  end
private
  def permissions(group)
    rows=ActiveRecord::Base.connection.select_all("select distinct activity_code,lob_code from group_permissions where status='A' and group_code='"+group+"'")
    #rows.map! do |row|
    #  row = OpenStruct.new(row)
    #  table = row.send(:table)
    #  table.each {|k, v| table[k] = select_type_cast(v) }
    #  row
    #end
    rows
  end
end
