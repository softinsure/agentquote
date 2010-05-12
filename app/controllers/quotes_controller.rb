class QuotesController < ApplicationController
  # GET /quotes
  # GET /quotes.xml
  def index
    @quotes = Quote.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quotes }
    end
  end

  # GET /quotes/clone/1
  # GET /quotes/clone/1.xml
 def endorse
    @quote=Quote.find(params[:id]).clone  :include=> [:xmlstore,:search_entities,:page_updated_info,:policy], :except => [:quote_number,:created_at ]
    @quote.xmlstore.original_xml=@quote.xmlstore.xmlstring
    @quote.quote_status='E'
    @quote.offset_premium=@quote.quoted_premium
    @quote.policy.transaction_code='E'
    @policy_header=@quote.policy.policy_header
    @policy_header.current_status='X'
    @policy_header.current_activity='Endorsement'
    @quote.save
    @policy_header.save
    #encodeXmls(@quote)
    set_in_use(@quote.id,"E");
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote.to_xml(:include => {:xmlstore=>{},:search_entities=>{},:page_updated_info=>{},:policy=>{:include =>:policy_header}})}
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
 end
  # GET /quotes/clone/1
  # GET /quotes/clone/1.xml
 def clone
    @quote=Quote.find(params[:id]).clone  :include=> [:xmlstore,:search_entities,:page_updated_info,:policy], :except => [:quote_number,:created_at ]
    @quote.xmlstore = Xmlstore.new if @quote.xmlstore == nil
    @quote.xmlstore.xmlstring=Xmlstore.get_acord_file(@quote.lob) if @quote.xmlstore.xmlstring ==nil
    @quote.save
    set_in_use(@quote.id,"E");
    #encodeXmls(@quote)
    #@quote.xmlstore.xmlstring=base64Encode(@quote.xmlstore.xmlstring)
    #@quote.xmlstore.menu_xml=base64Encode(@quote.xmlstore.menu_xml)
    #@quote.xmlstore.original_xml=base64Encode(@quote.xmlstore.original_xml)
    #@quote.xmlstore.payment_schedule=base64Encode(@quote.xmlstore.payment_schedule)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote.to_xml(:include => {:xmlstore=>{},:search_entities=>{},:page_updated_info=>{},:policy=>{:include =>:policy_header}})}
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
 end
  # GET /quotes/1
  # GET /quotes/1.xml
 def show
    @quote=Quote.find(params[:id])
    @quote.xmlstore = Xmlstore.new if @quote.xmlstore == nil
    logger.info "QuoteController#Edit: #{@quote.xmlstore.xmlstring}"
    @quote.xmlstore.xmlstring=Xmlstore.get_acord_file(@quote.lob) if @quote.xmlstore.xmlstring ==nil
    logger.info "QuoteController#Edit2: #{@quote.xmlstore.xmlstring}"
    encodeXmls(@quote)
    set_in_use(@quote.id,"V");
    #@quote.xmlstore.xmlstring=base64Encode(@quote.xmlstore.xmlstring)
    #@quote.xmlstore.menu_xml=base64Encode(@quote.xmlstore.menu_xml)
    #@quote.xmlstore.original_xml=base64Encode(@quote.xmlstore.original_xml)
    #@quote.xmlstore.payment_schedule=base64Encode(@quote.xmlstore.payment_schedule)
      respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote.to_xml(:include => {:xmlstore=>{},:search_entities=>{},:page_updated_info=>{},:policy=>{:include =>:policy_header}})}
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end
  # GET /quotes/1
  # GET /quotes/1.xml
 def edit
    @quote=Quote.find(params[:id])
    @quote.xmlstore = Xmlstore.new if @quote.xmlstore == nil
    @quote.xmlstore.xmlstring=Xmlstore.get_acord_file(@quote.lob) if @quote.xmlstore.xmlstring ==nil
    encodeXmls(@quote)
    set_in_use(@quote.id,"E");
    #@quote.xmlstore.xmlstring=base64Encode(@quote.xmlstore.xmlstring)
    #@quote.xmlstore.menu_xml=base64Encode(@quote.xmlstore.menu_xml)
    #@quote.xmlstore.original_xml=base64Encode(@quote.xmlstore.original_xml)
    #@quote.xmlstore.payment_schedule=base64Encode(@quote.xmlstore.payment_schedule)
      respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote.to_xml(:include => {:xmlstore=>{},:search_entities=>{},:page_updated_info=>{},:policy=>{:include =>:policy_header}})}
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end
  
  # GET /quotes/new
  # GET /quotes/new.xml
  def new
    @quote = Quote.new    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quote }
    end
  end
  
  # GET /quotes/1/edit
#  def edit
#    @quote = Quote.find(params[:id])
# end
  
  # POST /quotes
  # POST /quotes.xml
  def create
    @quote = Quote.new(params[:quote])  
    respond_to do |format|
      if @quote.save
        set_in_use(@quote.id,"E");
        flash[:notice] = 'Quote was successfully created.'
        format.html { redirect_to(@quote) }
        format.xml  { render :xml => @quote.to_xml(:include => {:xmlstore=>{},:search_entities=>{},:page_updated_info=>{}}), :status => :created, :location => @quote }
        #format.xml  { render :xml => @quote.to_xml(:include => [:xmlstore,:search_entities,:page_updated_info]), :status => :created, :location => @policy_header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => quote.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end
  
  # PUT /quotes/1
  # PUT /quotes/1.xml
  def update
    @quote = Quote.find(params[:id])
    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        flash[:notice] = 'Quote was successfully updated.'
        format.html { redirect_to(@quote) }
        format.xml  { head :ok }
    else
        format.html { render :action => "edit" }
        format.xml  { render :xml => quote.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end
  
  # DELETE /quotes/1
  # DELETE /quotes/1.xml
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to(quotes_url) }
      format.xml  { head :ok }
    end
    rescue ActiveRecord::RecordNotFound => e
      prevent_access(e)
  end
#  def release
#    @application_session.update_attributes(
#      :expired_at=>session_expired_at,
#      :quote_use_mode=>nil,
#      :qoute_in_use=>nil)
#    respond_to do |format|
#      format.html { redirect_to(quotes_url) }
#      format.xml  { head :ok }
#    end
#    rescue ActiveRecord::RecordNotFound => e
#      prevent_access(e)
#  end
  
  private
  def prevent_access(e)
    logger.info "QuoteController#prevent_access: #{e}"
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { render :text => "error" }
    end
  end
  def set_in_use(id,mode)
    @application_session.update_attributes(
      :expired_at=>session_expired_at,
      :qoute_in_use=>id,
      :quote_use_mode=>mode
   )
  end
  def encodeXmls(quote)
    quote.xmlstore.xmlstring=base64Encode(quote.xmlstore.xmlstring)
    quote.xmlstore.menu_xml=base64Encode(quote.xmlstore.menu_xml)
    quote.xmlstore.original_xml=base64Encode(quote.xmlstore.original_xml)
    quote.xmlstore.payment_schedule=base64Encode(quote.xmlstore.payment_schedule)
    quote.xmlstore.change_detail=base64Encode(quote.xmlstore.change_detail)
  end

end
