class Item < ActiveRecord::Base
   has_many :itemizations, :dependent => :destroy
   has_many :transactions, :through => :itemizations
   #has_many :categorizations, :dependent => :destroy
   belongs_to :category #, :through => :categorizations
   
   validates :item_name, presence: true, uniqueness: true, length: {minimum: 4}
   validates :category_id, presence: true
   validates :item_amount, presence: true, numericality: {greater_than_or_equal_to: 0}

   def category_name
   	category.try(:name)
   end

   def category_name=(name)
   	self.category = Category.find_by_category_name(name) if name.present?
   end
end
