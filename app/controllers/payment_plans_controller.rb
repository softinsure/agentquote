class PaymentPlansController < ApplicationController
  # GET /payment_plans
  # GET /payment_plans.xml
  def index
    @payment_plans = PaymentPlans.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @payment_plans }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /payment_plans/1
  # GET /payment_plans/1.xml
  def show
    @payment_plan = PaymentPlans.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @payment_plan }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /payment_plans/new
  # GET /payment_plans/new.xml
  def new
    @payment_plan = PaymentPlans.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @payment_plan }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /payment_plans/1/edit
  def edit
    @payment_plan = PaymentPlans.find(params[:id])
  end

  # POST /payment_plans
  # POST /payment_plans.xml
  def create
    @payment_plan = PaymentPlans.new(params[:payment_plan])
    @payment_plan.save!
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "Payment Plan was successfully created."
      end
      format.xml  { render :xml => @payment_plan.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @payment_plan.errors.empty?
          render :xml => @payment_plan.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
  end

  # PUT /payment_plans/1
  # PUT /payment_plans/1.xml
  def update
    @payment_plan = PaymentPlans.find(params[:id])
    @payment_plan.save!
    respond_to do |format|
      if @payment_plan.update_attributes(params[:payment_plan])
        flash[:notice] = 'PaymentPlan was successfully updated.'
        format.html { redirect_to(@payment_plan) }
        format.xml  { head :ok }
    else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @payment_plan.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /payment_plans/1
  # DELETE /payment_plans/1.xml
  def destroy
    @payment_plan = PaymentPlans.find(params[:id])
    @payment_plans.destroy

    respond_to do |format|
      format.html { redirect_to(payment_plans_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  private
  def prevent_access(e)
    logger.info "PaymentPlanController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
end
