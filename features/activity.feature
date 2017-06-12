Feature: Activity
As a user
I want to list activities
So that I can manage my schedule

Scenario: See new activities page
When I go to the activity create
Then I should see "Cadastrar Atividade"

Scenario: See activities page
When I go to the activity index
Then I should see "Atividades"
Then I should see "Ordem"


# TODO: escrever estes testes
# @javascript
# Scenario: User can up activities' priority
# When I click on up priority icon
# Then the activity
