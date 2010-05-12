class AgentsController < ApplicationController
  # GET /agents
  # GET /agents.xml
  def index
    @agents = Agent.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agents }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /agents/1
  # GET /agents/1.xml
  def show
    @agent = Agent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agent }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /agents/new
  # GET /agents/new.xml
  def new
    @agent = Agent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agent }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /agents/1/edit
  def edit
    @agent = Agent.find(params[:id])
  end

  # POST /agents
  # POST /agents.xml
  def create
    @agent = Agent.new(params[:agent])
    @agent.save!
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "Agent was successfully created."
      end
      format.xml  { render :xml => @agent.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @agent.errors.empty?
          render :xml => @agent.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
  end

  # PUT /agents/1
  # PUT /agents/1.xml
  def update
    @agent = Agent.find(params[:id])
    @agent.save!
    respond_to do |format|
      if @agent.update_attributes(params[:agent])
        flash[:notice] = 'Agent was successfully updated.'
        format.html { redirect_to(@agent) }
        format.xml  { head :ok }
    else
        format.html { render :action => "edit" }
        format.xml  { render :xml => agent.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /agents/1
  # DELETE /agents/1.xml
  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy

    respond_to do |format|
      format.html { redirect_to(agents_url) }
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
