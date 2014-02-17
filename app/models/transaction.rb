class Transaction < ActiveRecord::Base
   
   belongs_to :user
   has_many :itemizations, :dependent => :destroy
   belongs_to :item #, :through => :itemization
   
   # date_regex = /\d{2}\/d{2}\/\d{4}/
   validates_presence_of :user_id, message: "You must be logged in to enter a transaction"
   validates :item_id, presence: true
   validates :trans_date, presence: true
   validate :check_trans_date
   validate :validate_date_format
   validates :trans_amount, presence: true, numericality: {greater_than_or_equal_to: 1}
   
   def check_trans_date
      self.errors[:trans_date] << "can only be today or earlier." unless self.trans_date < Date.today rescue false
   end
   
   def validate_date_format
      self.errors[:trans_date] << "must be a valid date" unless Date.parse(self.trans_date) rescue false
   end

   def item_name
      item.try(:name)
   end

   def item_name=(name)
      self.item = Item.find_or_create_by_item_name!(name) unless name.blank?
   end
   
end
