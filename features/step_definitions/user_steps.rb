Given /^there are the following users:$/ do |table|
	table.hashes.each do|attributes|
		@user = User.create!(attributes) #An inbuild factory provided by devise 
	end
end