module ApplicationHelper

	def full_title(page_title = "")
		if page_title == ""
			full_title = "Inspire-Mee"
		else 
			page_title + " | Inspire-Mee"
		end
	end
end
