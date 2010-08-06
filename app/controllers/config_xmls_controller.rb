class ConfigXmlsController < ApplicationController
  # GET /config_xmls
  # GET /config_xmls.xml
  def index
    @config_xmls = ConfigXml.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @config_xmls }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /config_xmls/1
  # GET /config_xmls/1.xml
  def show
    @config_xml = ConfigXml.find(params[:id])
    #@config_xml.xmlstring=base64Encode(@config_xml.xmlstring)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @config_xml }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /config_xmls/new
  # GET /config_xmls/new.xml
  def new
    @config_xml = ConfigXml.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @config_xml }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /config_xmls/1/edit
  def edit
    @config_xml = ConfigXml.find(params[:id])
  end

  # POST /config_xmls
  # POST /config_xmls.xml
  def create
   @config_xml = ConfigXml.new(params[:config_xml])
    @config_xml.save!
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
        flash[:notice] = "ConfigXml was successfully created."
      end
      format.xml  { render :xml => @config_xml.to_xml }
    end
    rescue ActiveRecord::RecordInvalid
    respond_to do |format|
      format.html { render :action => 'new' }
      format.xml do
        unless @config_xml.errors.empty?
          render :xml => @config_xml.errors.to_xml_full
        else
          render :text => "error"
        end
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # PUT /config_xmls/1
  # PUT /config_xmls/1.xml
  def update
    @config_xml = ConfigXml.find(params[:id])
    @config_xml.save!

    respond_to do |format|
      if @config_xml.update_attributes(params[:config_xml])
        flash[:notice] = 'ConfigXml was successfully updated.'
        format.html { redirect_to(@config_xml) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @config_xml.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /config_xmls/1
  # DELETE /config_xmls/1.xml
  def destroy
    @config_xml = ConfigXml.find(params[:id])
    @config_xml.destroy

    respond_to do |format|
      format.html { redirect_to(config_xmls_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  private
  def prevent_access(e)
    logger.info "ConfigXml#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
end
