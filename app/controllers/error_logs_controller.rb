class ErrorLogsController < ApplicationController
  # GET /error_logs
  # GET /error_logs.xml
  def index
    @error_logs = ErrorLog.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @error_logs }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /error_logs/1
  # GET /error_logs/1.xml
  def show
    @error_log = ErrorLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @error_log }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
 end

  # GET /error_logs/new
  # GET /error_logs/new.xml
  def new
    @error_log = ErrorLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @error_log }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # GET /error_logs/1/edit
  def edit
    @error_log = ErrorLog.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # POST /error_logs
  # POST /error_logs.xml
  def create
    @error_log = ErrorLog.new(params[:error_log])

    respond_to do |format|
      if @error_log.save
        flash[:notice] = 'ErrorLog was successfully created.'
        format.html { redirect_to(@error_log) }
        format.xml  { render :xml => @error_log, :status => :created, :location => @error_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @error_log.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end

  # PUT /error_logs/1
  # PUT /error_logs/1.xml
  def update
    @error_log = ErrorLog.find(params[:id])

    respond_to do |format|
      if @error_log.update_attributes(params[:error_log])
        flash[:notice] = 'ErrorLog was successfully updated.'
        format.html { redirect_to(@error_log) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @error_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /error_logs/1
  # DELETE /error_logs/1.xml
  def destroy
    @error_log = ErrorLog.find(params[:id])
    @error_log.destroy

    respond_to do |format|
      format.html { redirect_to(error_logs_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
    prevent_access(e)
  end
  private
  def prevent_access(e)
    logger.info "ErrorLogsController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
 end
