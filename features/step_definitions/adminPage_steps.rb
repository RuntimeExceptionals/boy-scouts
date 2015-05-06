Given /^I am on the (.*) page/ do |name|
		visit path_to(name)
end

When /^I click on the (.*) link/ do |link|
		if(link.starts_with?("generate"))
			Group.create! :id => 1
		end
		visit path_to(link)
end

Then /^I should land on the (.*) page/ do |page|
		expect(current_path) == path_to(page)
end