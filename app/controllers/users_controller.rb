class UsersController < ApplicationController
  #skip_before_filter :login_required
  #before_filter :login_required, :except=>[:sessions]
  # GET /users/new
  # GET /users/new.xml
  def index
    @users = User.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e,self)
  end
  
  # GET /Users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  # POST /users
  # POST /users.xml
  def update
    #prevent2_access('test',self)
    @user = User.find(params[:id])
    @user.save!
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
    else
        format.html { render :action => "edit" }
        format.xml  { render :xml => user.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  # POST /users
  # POST /users.xml
  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc 
    # wreaks request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save!
    #self.current_user = @user
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "Thanks for signing up!"
      end
      format.xml  { render :xml => @user.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @user.errors.empty?
          render :xml => @user.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
  end
  private
  def prevent_access(e)
    logger.info "UserController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url)}
      format.xml  { render :xml => {:error=>e,:source=>"UserController#prevent_access"}}
      #format.xml  { render :text => "error" }
    end
  end
end
