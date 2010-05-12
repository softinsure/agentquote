# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  skip_before_filter :login_required   
  
  # render new.rhtml
  def new
  end

  def create
    logout_keeping_session!
    @session=params[:session]
    #user = User.authenticate(params[:login], params[:password])
    user = User.authenticate(@session[:login],@session[:password])
    if user
      self.current_user = user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      #new_cookie_flag = (params[:remember_me] == "1")
      new_cookie_flag = (@session[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      @agent = Agent.find_by_agent_code(user.agent_code)
      @agency = Agency.find_by_agency_code(@agent.agency_code)
      @permissions = permissions(user.group)
                
      respond_to do |format|
        format.html do
          redirect_back_or_default('/')
          flash[:notice] = "Logged in successfully"
        end
        #format.fxml  { render :xml => self.current_user.to_fxml }
        #format.xml  { render :xml => self.current_user.to_xml }
        format.xml  { render :xml => {:user=>self.current_user,:agent=>@agent,:agency=>@agency, :permissions=>@permissions}}
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
