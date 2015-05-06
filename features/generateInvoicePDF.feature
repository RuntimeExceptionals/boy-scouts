Feature: generate invoice pdf page to generate invoice pdf
	In order to generate an invoice as a pdf
	As an admin
	I want to be able to generate an invoice as a pdf

	Scenario: Access generate invoice pdf page
		Given I am on the groups list page
		When I click on the generate invoice pdf link
		Then I should land on the generate invoice pdf page