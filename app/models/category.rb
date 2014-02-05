class Category < ActiveRecord::Base
   has_many :categorizations, :dependent => :destroy
   has_many :items, :through => :categorizations
end