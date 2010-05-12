class SearchEntitiesController < ApplicationController
  # GET /search_entities
  # GET /search_entities.xml
  def index
    @search_entities = SearchEntities.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @search_entities }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /search_entities/1
  # GET /search_entities/1.xml
  def show
    @search_entities = SearchEntities.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @search_entities }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /search_entities/new
  # GET /search_entities/new.xml
  def new
    @search_entities = SearchEntities.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @search_entities }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /search_entities/1/edit
  def edit
    @search_entities = SearchEntities.find(params[:id])
  end

  # POST /search_entities
  # POST /search_entities.xml
  def create
    @search_entities = SearchEntities.new(params[:search_entities])

    respond_to do |format|
      if @search_entities.save
        flash[:notice] = 'SearchEntities was successfully created.'
        format.html { redirect_to(@search_entities) }
        format.xml  { render :xml => @search_entities, :status => :created, :location => @search_entities }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @search_entities.errors, :status => :unprocessable_entity }
      end
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @search_entities.errors.empty?
          render :xml => @search_entities.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
  end

  # PUT /search_entities/1
  # PUT /search_entities/1.xml
  def update
    @search_entities = SearchEntities.find(params[:id])

    respond_to do |format|
      if @search_entities.update_attributes(params[:search_entities])
        flash[:notice] = 'SearchEntities was successfully updated.'
        format.html { redirect_to(@search_entities) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @search_entities.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /search_entities/1
  # DELETE /search_entities/1.xml
  def destroy
    @search_entities = SearchEntities.find(params[:id])
    @search_entities.destroy

    respond_to do |format|
      format.html { redirect_to(search_entities_url) }
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
