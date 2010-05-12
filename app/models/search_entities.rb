class SearchEntities < ActiveRecord::Base
   belongs_to :quote
   stampable
end
