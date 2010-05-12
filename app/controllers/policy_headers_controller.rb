class PolicyHeadersController < ApplicationController
  # GET /policy_headers
  # GET /policy_headers.xml
  def index
    @policy_headers = PolicyHeader.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @policy_headers }
    end
     rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
 end

  # GET /policy_headers/1
  # GET /policy_headers/1.xml
  def show
    @policy_header = PolicyHeader.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @policy_header }
    end
   rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /policy_headers/new
  # GET /policy_headers/new.xml
  def new
    @policy_header = PolicyHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @policy_header }
    end
  end

  # GET /policy_headers/1/edit
  def edit
    @policy_header = PolicyHeader.find(params[:id])
  end

  # POST /policy_headers
  # POST /policy_headers.xml
  def create
    @policy_header = PolicyHeader.new(params[:policy_header])
    @maxPolicyNumber = PolicyHeader.maximum("id")
    if @maxPolicyNumber.nil?
      @maxPolicyNumber=0
    end
    
    @policy_header.policy_number = "%09d" % (Integer(@maxPolicyNumber)+1).to_s
    
    respond_to do |format|
      if @policy_header.save
        flash[:notice] = 'PolicyHeader was successfully created.'
        format.html { redirect_to(@policy_header) }
        format.xml  { render :xml => @policy_header, :status => :created, :location => @policy_header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @policy_header.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # PUT /policy_headers/1
  # PUT /policy_headers/1.xml
  def update
    @policy_header = PolicyHeader.find(params[:id])
    respond_to do |format|
      if @policy_header.update_attributes(params[:policy_header])
        flash[:notice] = 'PolicyHeader was successfully updated.'
        format.html { redirect_to(@policy_header) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @policy_header.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /policy_headers/1
  # DELETE /policy_headers/1.xml
  def destroy
    @policy_header = PolicyHeader.find(params[:id])
    @policy_header.destroy

    respond_to do |format|
      format.html { redirect_to(policy_headers_url) }
      format.xml  { head :ok }
    end
  end
  private
  def prevent_access(e)
    logger.info "PolicyHeadersController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
  end
