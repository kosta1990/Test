Feature: Guess the word
 # The first example has two steps
 Scenario: Maker starts a game
 When the maker starts a game
 Then the Maker waits for a Breaker to join
 Scenario: Breaker hoins a game
 Given the Maker has started a game with the word "silky"
 When the Breaker joins the Maker's game
 Then the Breaker must guess a word with 5 characters