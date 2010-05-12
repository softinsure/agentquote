class GroupActivitiesController < ApplicationController
  # GET /group_activities
  # GET /group_activities.xml
  def index
    @group_activities = GroupActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_activities }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /group_activities/1
  # GET /group_activities/1.xml
  def show
    @group_activity = GroupActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_activity }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /group_activities/new
  # GET /group_activities/new.xml
  def new
    @group_activity = GroupActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_activity }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /group_activities/1/edit
  def edit
    @group_activity = GroupActivity.find(params[:id])
  end

  # POST /group_activities
  # POST /group_activities.xml
  def create
    @group_activity = GroupActivity.new(params[:group_activity])
    @group_activity.save!

    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "Group Activity was successfully created."
      end
      format.xml  { render :xml => @group_activity.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @group_activity.errors.empty?
          render :xml => @group_activity.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
  end

  # PUT /group_activities/1
  # PUT /group_activities/1.xml
  def update
    @group_activity = GroupActivity.find(params[:id])
    @group_activity.save!

    respond_to do |format|
      if @group_activity.update_attributes(params[:group_activity])
        flash[:notice] = 'GroupActivity was successfully updated.'
        format.html { redirect_to(@group_activity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_activity.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /group_activities/1
  # DELETE /group_activities/1.xml
  def destroy
    @group_activity = GroupActivity.find(params[:id])
    @group_activity.destroy

    respond_to do |format|
      format.html { redirect_to(group_activities_url) }
      format.xml  { head :ok }
    end
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
