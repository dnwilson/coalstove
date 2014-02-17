module ApplicationHelper
	def full_title(page_title)
		base_title = "coalstove"
		@page_site_name = "coalstove"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def category_select(id, name)
		@categories = Category.all
		@categories.each do |cat|
			title = cat.category_name
			number = cat.category_id
		end
		[number, title]
	end

	def acct_name(id)
		item = Item.find(id)
		category = Category.find(item.category_id)
		name = Account.find(category.account_id).account_name
	end
end