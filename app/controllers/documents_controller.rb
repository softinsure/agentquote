class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.xml
  def index
    @documents = Document.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documents.to_xml }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /documents/1
  # GET /documents/1.xml
  def show
    @documents = Document.find_by_quote_id(params[:quote_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @documents }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /documents/new
  # GET /documents/new.xml
  def new
	#debugger
    @documents = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documents }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /documents/1/edit
  def edit
   @documents = Document.find_by_quote_id(params[:id])
    rescue ActiveRecord::RecordNotFound => e
   prevent_access(e)
  end

  # POST /documents
  # POST /documents.xml
  def create
  	# require 'Base64'
    #debugger
    @documents = Document.new(params[:documents])

    respond_to do |format|
      if @documents.save
        flash[:notice] = 'Documents was successfully created.'
        format.html { redirect_to(@documents) }
        format.xml  { render :xml => @documents, :status => :created, :location => @documents }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @documents.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # PUT /documents/1
  # PUT /documents/1.xml
  def update
    @documents = Document.find_by_quote_id(params[:quote_id])
   
    respond_to do |format|
      if @documents.update_attributes(params[:documents])
        flash[:notice] = 'Documents was successfully updated.'
        format.html { redirect_to(@documents) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documents.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
   end

  # DELETE /documents/1
  # DELETE /documents/1.xml
  def destroy
    @documents = Document.find_by_quote_id(params[:id])
    quote_@documents.destroy

    respond_to do |format|
      format.html { redirect_to(documents_url) }
      format.xml  { render :xml => @quote }
    end
   rescue ActiveRecord::RecordNotFound => e
   prevent_access(e)
 end
  private
  def prevent_access(e)
    logger.info "DocumentsController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
 end
