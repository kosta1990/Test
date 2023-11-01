Feature: Basic Flow (BF)
Providing my own TIN (Steuer-Identifikationsnummer) with Mobile TAN based authentication


Scenario Outline: Relevant validation examples for TIN Numbers
  When a Customer provides <TIN> as her TIN number
  Then a proper validation <RESULT> has to be provided to her sdfsdfsd
  When user adds 1 item "CQ0003"
  Then user returns to shopping screenasdfsdf
And asdsdgdfdf

  Examples:
      | TIN           | RESULT       |
      |               | NONE_PROVIDED|
      | 1000000000    | NOT_11_CHARS |
	  
Scenario: Successful shopping
Given user has logged on successfully
When user adds 1 item "CQ0003"
Then user returns to shopping screen