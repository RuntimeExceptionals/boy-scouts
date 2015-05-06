Feature: groupList page to view Group Lists
	In order to go to groupList page
	As a troop admin
	I want to be able to access the list of groups
	
	Scenario: Access groups list page
		Given I am on the home page
		When I click on the groupList link
		Then I should land on the groupList page

	Scenario: Access admin page
		Given I am on the groups list page
		When I click on the admin link
		Then I should land on the admin page

	Scenario: Access database dashboard
		Given I am on the groups list page
		When I click on the dashboard link
		Then I should land on the dashboard page

	Scenario: Access list of users
  		Given I am on the groups list page
  		When I click on the users link
  		Then I should land on the users list page

  	Scenario: Access subscription payment page
  		Given I am on the groups list page
  		When I click on the payments link 
  		Then I should land on the payments page

  	Scenario: Access home page from groups list page
  		Given I am on the groups list page
  		When I click on the home link
  		Then I should land on the home page

  	Scenario: Access list of routes
  		Given I am on the groups list page
  		When I click on the routes link
  		Then I should land on the routes list page

  	Scenario: Access list of runs
  		Given I am on the groups list page
  		When I click on the runs link
  		Then I should land on the runs list page

  	Scenario: Access list of subscriptions
  		Given I am on the groups list page
  		When I click on the subscriptions link
  		Then I should land on the subscriptions list page

  	Scenario: Access list of member runs
  		Given I am on the groups list page
  		When I click on the member runs link
  		Then I should land on the member runs list page

  	Scenario: Access list of tasks
  		Given I am on the groups list page
  		When I click on the tasks link
  		Then I should land on the tasks list page

    Scenario: Generate runsheet pdf
      Given I am on the groups list page
      When I click on the generate run sheets pdf link
      Then I should land on the generate run sheets pdf page

    Scenario: Generate runsheet
      Given I am on the groups list page
      When I click on the generate run sheets link
      Then I should land on the generate run sheets page

    Scenario: Generate group report pdf
      Given I am on the groups list page
      When I click on the generate group report pdf link
      Then I should land on the generate group report pdf page

    Scenario: Generate invoice pdf
      Given I am on the groups list page
      When I click on the generate invoice pdf link
      Then I should land on the generate invoice pdf page

    Scenario: Generate invoice
      Given I am on the groups list page
      When I click on the generate invoice link
      Then I should land on the generate invoice page