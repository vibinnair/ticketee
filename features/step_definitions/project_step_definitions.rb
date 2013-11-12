Given /^I am on the homepage$/ do 
	visit('/')
end

When /^I follow "New Project"$/ do
	click_link('New Project')
end

When /^I fill in "Name" with "TextMate 2"$/ do
	fill_in('Name', with:'TextMate 2') 
end

When /^I press "Create Project"$/ do
	click_button "Create Project"
end

Then /^I should see "Project has been created."$/ do
	expect(page).to have_content 'Project has been created.'
end

Then /^I should be on the project page for "TextMate 2"$/ do
	# We use the exclamatory find_by_name! function as it throws an exception when the specific row 
	# is not found in table. 	

	# Rails creates dynamic find_by_* methods for searching, where * will be a columnname of the table
    # to which the Model corresponds.
	project = Project.find_by_name!("TextMate 2")
	project_path(project)
end

Then /^I should see "TextMate 2 - Projects - Ticketee"$/ do
	expect(page).to have_title("TextMate 2 - Projects - Ticketee")
end