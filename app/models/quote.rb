class Quote < ActiveRecord::Base
  has_one :xmlstore,:class_name => 'Xmlstore', :dependent => :destroy
  accepts_nested_attributes_for :xmlstore, :allow_destroy => true
  has_one :search_entities,:class_name => 'SearchEntities', :dependent => :destroy
  accepts_nested_attributes_for :search_entities, :allow_destroy => true
  #has_many :document, :dependent => :destroy
  has_many :page_updated_info,:class_name => 'PageUpdatedInfo', :dependent => :destroy
  accepts_nested_attributes_for :page_updated_info, :allow_destroy => true
  belongs_to :policy
  stampable
  validates_associated :page_updated_info
  def before_create
    if self.xmlstore.nil?
      self.xmlstore = Xmlstore.new
    end
    if self.search_entities.nil?
      self.search_entities = SearchEntities.new
    end
    init_quote
  end  
  def init_quote
    @quoteid=Quote.maximum("id")
    if @quoteid.nil?
      @quoteid=0
    end
    self.quote_number = "%09d" % (@quoteid+1).to_s
    self.quote_effective_date = Date.today if self.quote_effective_date == nil
    self.policy_effective_date = Date.today if self.policy_effective_date == nil
    self.quote_expiration_date = Date.today+1.month if self.quote_expiration_date == nil
  end
end