class BillingInfosController < ApplicationController
  # GET /billing_infos
  # GET /billing_infos.xml
  def index
    @billing_infos = BillingInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @billing_infos }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /billing_infos/1
  # GET /billing_infos/1.xml
  def show
    @billing_info = BillingInfo.find(params[:id])
    @billing_info.payment_schedule=base64Encode(@billing_info.payment_schedule)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @billing_info }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /billing_infos/new
  # GET /billing_infos/new.xml
  def new
    @billing_info = BillingInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @billing_info }
    end
  end

  # GET /billing_infos/1/edit
  def edit
    @billing_info = BillingInfo.find(params[:id])
  end

  # POST /billing_infos
  # POST /billing_infos.xml
  def create
    @billing_info = BillingInfo.new(params[:billing_info])

    respond_to do |format|
      if @billing_info.save
        format.html { redirect_to(@billing_info, :notice => 'BillingInfo was successfully created.') }
        format.xml  { render :xml => @billing_info, :status => :created, :location => @billing_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @billing_info.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # PUT /billing_infos/1
  # PUT /billing_infos/1.xml
  def update
    @billing_info = BillingInfo.find(params[:id])

    respond_to do |format|
      if @billing_info.update_attributes(params[:billing_info])
        format.html { redirect_to(@billing_info, :notice => 'BillingInfo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @billing_info.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /billing_infos/1
  # DELETE /billing_infos/1.xml
  def destroy
    @billing_info = BillingInfo.find(params[:id])
    @billing_info.destroy

    respond_to do |format|
      format.html { redirect_to(billing_infos_url) }
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
