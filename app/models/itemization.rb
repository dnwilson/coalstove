class Itemization < ActiveRecord::Base
   belongs_to :item
   belongs_to :transaction
end