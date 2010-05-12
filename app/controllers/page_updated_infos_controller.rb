class PageUpdatedInfosController < ApplicationController
  # GET /page_updated_infos
  # GET /page_updated_infos.xml
  def index
    @page_updated_infos = PageUpdatedInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @page_updated_infos }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
 end

  # GET /page_updated_infos/1
  # GET /page_updated_infos/1.xml
  def show
    #@page_updated_info = Quote.PageUpdatedInfo.find(params[:id])
    @page_updated_info = PageUpdatedInfo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page_updated_info }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /page_updated_infos/new
  # GET /page_updated_infos/new.xml
  def new
    @page_updated_info = PageUpdatedInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page_updated_info }
    end
  end

  # GET /page_updated_infos/1/edit
  def edit
    @page_updated_info = PageUpdatedInfo.find(params[:id])
  end

  # POST /page_updated_infos
  # POST /page_updated_infos.xml
  def create
    @page_updated_info = PageUpdatedInfo.new(params[:page_updated_info])

    respond_to do |format|
      if @page_updated_info.save
        flash[:notice] = 'PageUpdatedInfo was successfully created.'
        format.html { redirect_to(@page_updated_info) }
        format.xml  { render :xml => @page_updated_info, :status => :created, :location => @page_updated_info }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page_updated_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /page_updated_infos/1
  # PUT /page_updated_infos/1.xml
  def update
    @page_updated_info = PageUpdatedInfo.find(params[:id])
    #@page_updated_info.save!
    #PageUpdatedInfo.attr_accessible :id,:required_fields_entered, :pageid, :quote_id
    respond_to do |format|
      if @page_updated_info.update_attributes(params[:page_updated_info])
        flash[:notice] = 'PageUpdatedInfo was successfully updated.'
        format.html { redirect_to(@page_updated_info) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page_updated_info.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # DELETE /page_updated_infos/1
  # DELETE /page_updated_infos/1.xml
  def destroy
    @page_updated_info = PageUpdatedInfo.find(params[:id])
    @page_updated_info.destroy

    respond_to do |format|
      format.html { redirect_to(page_updated_infos_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  private
  def prevent_access(e)
    logger.info "PageUpdatedInfo#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :xml => {:error=>e,:source=>"PageUpdatedInfo#prevent_access"}}
    end
  end
end
