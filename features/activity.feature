Feature: Activity
As a user

Scenario: See new activities page
When I go to the activity create
Then I should see "Cadastrar Atividade"

Scenario: See activities page
When I go to the activity index
Then I should see "Atividades"
Then I should see "Ordem"