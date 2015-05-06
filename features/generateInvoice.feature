Feature: generate invoice page to generate invoice 
	In order to generate an invoice
	As an admin
	I want to be able to generate an invoice

	Scenario: Access generate invoice page
		Given I am on the groups list page
		When I click on the generate invoice link
		Then I should land on the generate invoice page