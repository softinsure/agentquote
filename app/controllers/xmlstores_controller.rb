class XmlstoresController < ApplicationController
  # GET /xmlstores
  # GET /xmlstores.xml
  def index
    @xmlstores = Xmlstore.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @xmlstores.to_xml }
    end
  end

  # GET /xmlstores/1
  # GET /xmlstores/1.xml
  def show
      @xmlstore = Xmlstore.find(params[:id])
      @xmlstore.xmlstring=base64Encode(@xmlstore.xmlstring)
      @xmlstore.menu_xml=base64Encode(@xmlstore.menu_xml)
      @xmlstore.original_xml=base64Encode(@xmlstore.original_xml)
      @xmlstore.payment_schedule=base64Encode(@xmlstore.payment_schedule)
      @xmlstore.change_detail=base64Encode(@xmlstore.change_detail)
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @xmlstore}
      end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  # GET /xmlstores/new
  # GET /xmlstores/new.xml
  def new
    @xmlstore = Xmlstore.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @xmlstore }
    end
  end

  # GET /xmlstores/1/edit
  def edit
   @xmlstore = Xmlstore.find_by_quote_id(params[:id])
    rescue ActiveRecord::RecordNotFound => e
   prevent_access(e)
  end

  # POST /xmlstores
  # POST /xmlstores.xml
  def create
    @xmlstore = Xmlstore.new(params[:xmlstore])

    respond_to do |format|
      if @xmlstore.save
        flash[:notice] = 'Xmlstore was successfully created.'
        format.html { redirect_to(@xmlstore) }
        format.xml  { render :xml => @xmlstore, :status => :created, :location => @xmlstore }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @xmlstore.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /xmlstores/1
  # PUT /xmlstores/1.xml
  def update
    @xmlstore = Xmlstore.find(params[:id])
    respond_to do |format|
      if @xmlstore.update_attributes(params[:xmlstore])
        flash[:notice] = 'Xmlstore was successfully updated.'
        format.html { redirect_to(@xmlstore) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @xmlstore.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /xmlstores/1
  # DELETE /xmlstores/1.xml
  def destroy
    #@xmlstore = Xmlstore.find(params[:id])
    @xmlstore = Xmlstore.find_by_quote_id(params[:quote_id])
    @xmlstore.destroy

    respond_to do |format|
      format.html { redirect_to(xmlstores_url) }
      format.xml  { render :xml => @quote }
    end
   rescue ActiveRecord::RecordNotFound => e
   prevent_access(e)
 end
  private
  def prevent_access(e)
    logger.info "XmlstoreController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
end
