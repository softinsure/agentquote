class LineOfBusinessesController < ApplicationController
  # GET /line_of_businesses
  # GET /line_of_businesses.xml
  def index
    @line_of_businesses = LineOfBusiness.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_of_businesses }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /line_of_businesses/1
  # GET /line_of_businesses/1.xml
  def show
    @line_of_business = LineOfBusiness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_of_business }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /line_of_businesses/new
  # GET /line_of_businesses/new.xml
  def new
    @line_of_business = LineOfBusiness.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_of_business }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /line_of_businesses/1/edit
  def edit
    @line_of_business = LineOfBusiness.find(params[:id])
  end

  # POST /line_of_businesses
  # POST /line_of_businesses.xml
  def create
    @line_of_business = LineOfBusiness.new(params[:line_of_business])
    @line_of_business.save!

    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "LOB was successfully created."
      end
      format.xml  { render :xml => @line_of_business.to_xml }
    end
  rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @line_of_business.errors.empty?
          render :xml => @line_of_business.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
  end

  # PUT /line_of_businesses/1
  # PUT /line_of_businesses/1.xml
  def update
    @line_of_business = LineOfBusiness.find(params[:id])
    @line_of_business.save!

    respond_to do |format|
      if @line_of_business.update_attributes(params[:line_of_business])
        flash[:notice] = 'LineOfBusiness was successfully updated.'
        format.html { redirect_to(@line_of_business) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_of_business.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /line_of_businesses/1
  # DELETE /line_of_businesses/1.xml
  def destroy
    @line_of_business = LineOfBusiness.find(params[:id])
    @line_of_business.destroy

    respond_to do |format|
      format.html { redirect_to(line_of_businesses_url) }
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
