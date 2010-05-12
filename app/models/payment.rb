class Payment < ActiveRecord::Base
	belongs_to :quote
	stampable
end
