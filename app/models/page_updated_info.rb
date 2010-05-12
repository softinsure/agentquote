class PageUpdatedInfo < ActiveRecord::Base
  belongs_to :quote
  stampable
  before_update:force_update
  def force_update
    self.updated_at=Date.today
  end
end
