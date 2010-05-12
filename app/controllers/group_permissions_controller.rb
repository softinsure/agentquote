class GroupPermissionsController < ApplicationController
  # GET /group_permissions
  # GET /group_permissions.xml
  def index
    @group_permissions = GroupPermission.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_permissions }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /group_permissions/1
  # GET /group_permissions/1.xml
  def show
    @group_permission = GroupPermission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_permission }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /group_permissions/new
  # GET /group_permissions/new.xml
  def new
    @group_permission = GroupPermission.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_permission }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /group_permissions/1/edit
  def edit
    @group_permission = GroupPermission.find(params[:id])
  end

  # POST /group_permissions
  # POST /group_permissions.xml
  def create
    @group_permission = GroupPermission.new(params[:group_permission])
    @group_permission.save!
    
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "Group Permission was successfully created."
      end
      format.xml  { render :xml => @group_permission.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @group_permission.errors.empty?
          render :xml => @group_permission.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
  end

  # PUT /group_permissions/1
  # PUT /group_permissions/1.xml
  def update
    @group_permission = GroupPermission.find(params[:id])
    @group_permission.save!
    
    respond_to do |format|
      if @group_permission.update_attributes(params[:group_permission])
        flash[:notice] = 'GroupPermission was successfully updated.'
        format.html { redirect_to(@group_permission) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_permission.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /group_permissions/1
  # DELETE /group_permissions/1.xml
  def destroy
    @group_permission = GroupPermission.find(params[:id])
    @group_permission.destroy

    respond_to do |format|
      format.html { redirect_to(group_permissions_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  private
  def prevent_access(e)
    logger.info "GroupActivity#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
end
