module ApplicationHelper
	def title(*parts)
		# if title is called with some aruments then go ahead and create a title tag with the argument as it content.
		unless parts.empty?
			#create content block for title tag. Going ahead we will render this content block using yield.
			content_for :title do 
				(parts << "Ticketee").join(" - ") unless parts.empty? 
			end 
		end
	end
end

#Our aim is to remove the title setting logic from show.html and move it to helper.

# Here we create a title tag using the content_for function, with the arguments passed to the title helper function. 

# In show,html.erb(which is a template) we call this helper function and pass the project name and "Projects" string.

# In application.html.erb(which is a layout), we check if the title tag is already defined by using the 
# content_for? function. (content_for :title defines a content for title tag and content_for? checks if 
# content for title tag is # defined). 
# Now as templates are executed before layouts (i.e all function calls, variables. content blocks etc are 
# already executed and kept before calling layouts), content_for? is true and then we call a yield and 
# pass it the name of the content block, which causes the content for that block to be rendered.
# (Ref: Rails 3 in Action: Pg 76)

# What are content blocks?
# Find and add here.