Given /^I am on the homepage$/ do 
	visit('/')
end

When /^I follow "([^\"]*)"$/ do |link_text|
	click_link(link_text)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |input_name, input_value|
	fill_in(input_name, with:input_value) 
end

When /^I press "([^\"]*)"$/ do |button_text|
	click_button button_text
end

Then /^I should be on the project page for "([^\"]*)"$/ do |project_name|
	# We use the exclamatory find_by_name! function as it throws an exception when the specific row 
	# is not found in table. 	

	# Rails creates dynamic find_by_* methods for searching, where * will be a columnname of the table
    # to which the Model corresponds.
	project = Project.find_by_name!(project_name)
	project_path(project)
end

And /^I should see "([^\"]*)"$/ do |display_text|
	expect(page).to have_content display_text
end

And /^I should not see "([^\"]*)"$/ do |display_text|
	expect(page).to have_no_content display_text
end

And /^I should see title as "([^\"]*)"$/ do |title_text|
	expect(page).to have_title title_text
end

Given /^there is a project called "([^\"]*)"$/ do |project_name|
	#(Ref: Making a factory : https://github.com/thoughtbot/factory_girl/wiki/Usage)
	@project = FactoryGirl.create(:project, name:project_name)
end

And /^that project has a ticket:$/ do |table|
	# table.hashes returns array of hashes, where each hash contains one entire row of the table;
	# Calling an each on table.hashes iterates through the array of hashes and gives one hash which - 
	# represents one row in the table. We get it in attributes parameter and pass that directly to -
	# the model for creation(i.e factpory to be more precise).  
	table.hashes.each do |attributes| 
		@project.tickets.create(attributes)
	end
end

Then /^I should see "([^\"]*)" within "([^\"]*)"$/ do |display_text, selector|
	# use within(selector) if you’re looking for content in a particular area.
	# Ref: 
	# http://learn.thoughtbot.com/test-driven-rails-resources/capybara.pdf
	# 
	within(selector) do
		expect(page).to have_content(display_text) 
	end	
end