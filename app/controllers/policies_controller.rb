class PoliciesController < ApplicationController
  # GET /policies
  # GET /policies.xml
  def index
    @policies = Policy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @policies }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /policies/1
  # GET /policies/1.xml
  def show
    @policy = Policy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @policy }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /policies/new
  # GET /policies/new.xml
  def new
    @policy = Policy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @policy }
    end
  end

  # GET /policies/1/edit
  def edit
    @policy = Policy.find(params[:id])
  end

  # POST /policies
  # POST /policies.xml
  def create
    logger.info params[:policy]
    @policy = Policy.new(params[:policy])
    #@policy.policy_number = "%09d" % (Integer(Policy.maximum("policy_number"))+1).to_s
    respond_to do |format|
      if @policy.save
        flash[:notice] = 'Policy was successfully created.'
        format.html { redirect_to(@policy) }
        format.xml  { render :xml => @policy, :status => :created, :location => @policy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @policy.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # PUT /policies/1
  # PUT /policies/1.xml
  def update
    @policy = Policy.find(params[:id])

    respond_to do |format|
      if @policy.update_attributes(params[:policy])
        flash[:notice] = 'Policy was successfully updated.'
        format.html { redirect_to(@policy) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @policy.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /policies/1
  # DELETE /policies/1.xml
  def destroy
    @policy = Policy.find(params[:id])
    @policy.destroy

    respond_to do |format|
      format.html { redirect_to(policies_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  private
  def prevent_access(e)
    logger.info "PolicyController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
end
