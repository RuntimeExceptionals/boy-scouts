Feature: generate group report pdf page to generate a group report
	In order to generate a group report as a pdf
	As an admin
	I want to be able to generate a group report as a pdf

	Scenario: Access generate group report pdf page
		Given I am on the groups list page
		When I click on the generate group report pdf link
		Then I should land on the generate group report pdf page