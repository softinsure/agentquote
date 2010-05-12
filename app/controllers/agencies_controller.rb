class AgenciesController < ApplicationController
  # GET /agencies
  # GET /agencies.xml
  def index
    @agencies = Agency.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agencies }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /agencies/1
  # GET /agencies/1.xml
  def show
    @agency = Agency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agency }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /agencies/new
  # GET /agencies/new.xml
  def new
    @agency = Agency.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agency }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /agencies/1/edit
  def edit
    @agency = Agency.find(params[:id])
  end

  # POST /agencies
  # POST /agencies.xml
  def create
    @agency = Agency.new(params[:agency])
    @agency.agency_code = "%05d" % (Integer(Agency.maximum("agency_code"))+1).to_s
    @agency.save!
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "Agency was successfully created."
      end
      format.xml  { render :xml => @agency.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @agency.errors.empty?
          render :xml => @agency.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
  end

  # PUT /agencies/1
  # PUT /agencies/1.xml
  def update
    @agency = Agency.find(params[:id])
    @agency.save!
    respond_to do |format|
      if @agency.update_attributes(params[:agency])
        flash[:notice] = 'Agency was successfully updated.'
        format.html { redirect_to(@agency)}
        format.xml  { head :ok }
        #format.xml  { render :xml => @agency }
    else
        format.html { render :action => "edit" }
        format.xml  { render :xml => agency.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.xml
  def destroy
    @agency = Agency.find(params[:id])
    @agency.destroy

    respond_to do |format|
      format.html { redirect_to(agencies_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  private
  def prevent_access(e)
    logger.info "AgentLogsController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "agent" }
    end
  end
end
