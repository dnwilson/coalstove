class Item < ActiveRecord::Base
   has_many :item_transactions, :dependent => :destroy
   has_many :transactions, :through => :item_transactions
   has_many :categorizations, :dependent => :destroy
   has_one :category, :through => :categorizations
   
   validates :item_name, presence: true, length: {minimum: 4}
   validates :category_id, presence: true
   validates :item_amount, presence: true, numericality: {greater_than_or_equal_to: 0}
end
