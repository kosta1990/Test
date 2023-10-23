Feature: Basic Flow (BF)
Providing my own TIN (Steuer-Identifikationsnummer) with Mobile TAN based authentication

Background:
Given A Customer is logged in 
And has required roles to be able to manage the TIN entry
And has at least one account at Consorsbank
And there is no information in the system about her TIN already available (e.g. hasn't provided her TIN yet)

Scenario:
When She goes to the Steuer and Steuer ID section 
Then She must be provided general information about TIN legal regulations and meanings
And she must be provided the information that her TIN is currently not available in the system
And she must be provided with an according CTA to provide her TIN
Given she went to the Steuer and Steuer ID section
When She follows a CTA for TIN entry
Then She must be provided with the following properties/fields:
And (1) her last name (read-only)
And (2) her title and her first name (read-only)
And (3) a field for her TIN entry
And (4) and the entry field for the TAN including following two options to generate the TAN 
And (a) TAN APPLI-1 (detailed manual about how to use TAN Generator in order to generate TAN) 
And (b) Mobile TAN generation request (CTA to be provided with TAN via SMS)  
And the following 2 CTAs:
And (1) to go back to overview page
And (2) to confirm the provided entries and submit the form for processing

Given she went to the Steuer and Steuer ID section
And she followed a CTA for TIN entry
When She follows a CTA for mobile TAN generation
Then She will be provided a new TAN via SMS to her mobile phone

Given she went to the Steuer and Steuer ID section
And she followed a CTA for TIN entry
And she followed a CTA for mobile TAN generation
And she received a valid new TAN via SMS to her mobile phone
When She provides both the TAN she got via SMS and her TIN number
Then She must not be allowed to trigger the same change until the processing is done
And her TIN number must be saved in the system
And she must be provided with an according confirmation page about successful TIN processing

Feature: Alternative Flow (AF1)
Providing my own TIN (Steuer-Identifikationsnummer) with TAN Generator based authentication

Background:
Given A Customer is logged in 
And has required roles to be able to manage the TIN entry
And has at least one account at Consorsbank
And there is no information in the system about her TIN already available (e.g. hasn't provided her TIN yet)

Scenario:
When She goes to the Steuer and Steuer ID section 
Then She must be provided general information about TIN legal regulations and meanings
And she must be provided the information that her TIN is currently not available in the system
And she must be provided with an according CTA to provide her TIN

Given she went to the Steuer and Steuer ID section
When She follows a CTA for TIN entry
Then She must be provided with the following properties/fields:
And (1) her last name (read-only)
And (2) her title and her first name (read-only)
And (3) a field for her TIN entry
And (4) and the entry field for the TAN including following two options to generate the TAN 
And (a) TAN APPLI-1 (detailed manual about how to use TAN Generator in order to generate TAN) 
And  (b) Mobile TAN generation request (CTA to be provided with TAN via SMS)  
And The following 2 CTAs:
And (1) to go back to overview page
And (2) to confirm the provided entries and submit the form for processing

Given she went to the Steuer and Steuer ID section
And she followed a CTA for TIN entry
And she followed a CTA for TAN Generator based authentication
And she retrieved a valid new TAN while following instructions provided
When She provides both the TAN she retrieved from TAN Generator and her TIN number
Then She must not be allowed to trigger the same change until the processing is done
And TIN number must be saved in the system
And she must be provided with an according confirmation page about successful TIN processing


Feature: Alternative Flow (AF2)
Displaying TIN (Steuer-Identifikationsnummer) to the Customer

Background:
Given A Customer is logged in 
And has at least one account at Consorsbank
And has provided her TIN already
When She goes to the Steuer and Steuer ID section 
Then She must be provided with the detailed view of her TIN related data already available in the systemthat consists of the following:
(1) A general information about TIN legal regulations and meanings
(2) her last name (read-only)
(3) her title and her first name (read-only)
(4) her TIN entry
And a single CTA to change her currently stored TIN number.

Feature: Alternative Flow (AF3)
Change TIN (Steuer-Identifikationsnummer)

Background:
Given A Customer is logged in
And has at least one account at Consorsbank
And has provided her TIN already
And she went to the Steuer and Steuer ID section
And she has been provided with the detailed view of her TIN related data already available in the system including a single CTA to change her currently stored TIN number.
When She decides to change the TIN number currently stored and assigned to her in the system
Then She must be provided with a form containing the following properties/fields:
(1) her last name (read-only)
(2) her title and her first name (read-only)
(3) a field for her TIN entry having the value set to the TIN currently stored in the system
(4) and the entry field for the TAN including following two options to generate the TAN
(a) TAN APPLI-1 (detailed manual about how to use TAN Generator in order to generate TAN)
(b) Mobile TAN generation request (CTA to be provided with TAN via SMS)
And the following 2 CTAs:
(1) to go back to overview page
(2) to confirm the provided entries and submit the form for processing


Feature: Alternative Flow (AF4)
Non resident tax payer

Background:
Given A Customer is logged in
And has required roles to be able to manage the TIN entry
And has at least one account at Consorsbank
And she is not a resident taxpayer (she does not pay her taxes in germany)
When She goes to the Steuer and Steuer ID section
Then An accordingmessage will beshownto her "Die Anzeige der Steuer-Identifikationsnummer (TIN) ist nur für Steuerinländer möglich."
And she won't be allowed to manage her TIN in the system.


Feature: Alternative Flow (AF5)
Not in one of the required roles (

Background:
Given A Customer is logged in
And does not have any of the required roles ("de.cust.standard", "de.cust.startrader","de.cust.platinum") for managing the TIN entry
When She goes to the Steuer and Steuer ID section
Then An accordingmessage will beshownto her "Die Anzeige der Steuer-Identifikationsnummer (TIN) ist leider nicht möglich."
And she won't be allowed to manage her TIN in the system.


Feature: Alternative Flow (AF6)
Wrong TIN entry ( for additional information see Steuer ID - TIN Validation Algorithm)

Scenario: No TIN number provided
Given A Customer is logged in
And has required roles to be able to manage the TIN entry
And has at least one account at Consorsbank
And there is no information in the system about her TIN already available (e.g. hasn't provided her TIN yet)
And she went to the Steuer and Steuer ID section
And she followed a CTA for TIN entry
When She doesn't provide any TIN number while trying to update her TIN information
Then An according violation message ("Die Steuer-Identifikationsnummer (TIN) istungültig.") must be provided together with an option to provide a proper TIN number

Scenario: An invalid TIN number provided
GivenA Customer is logged in
And has required roles to be able to manage the TIN entry
And has at least one account at Consorsbank
And there is no information in the system about her TIN already available (e.g. hasn't provided her TIN yet)
And she went to the Steuer and Steuer ID section
And she followed a CTA for TIN entry
WhenShe provides an invalid TIN number while trying to update her TIN information
ThenAn according violation message ("Die Steuer-Identifikationsnummer (TIN) istungültig.") must be provided together with an option to provide a proper TIN number


Feature: TIN Number Validations (AF6)
  A TIN must follow a specific format that is to be validated here:
  - it must have a length of 11
  - it must not start with a 0
  - within the first ten digits there is only one digit twice or three times to be found and accordingly one or two digits not contained at all
  - the eleventh digit is to be calculated based upon the first ten digits of the TIN

Background:
  Given a Customer can successfully get to TIN entry

Scenario Outline: Relevant validation examples for TIN Numbers
  When a Customer provides <TIN> as her TIN number
  Then a proper validation <RESULT> has to be provided to her
  Examples:
      | TIN           | RESULT       |
      |               | NONE_PROVIDED|
      | 1000000000    | NOT_11_CHARS |
      | 100000000000  | NOT_11_CHARS |
      | 02345678901   | LEADING_ZERO |
      | 12345678990   | INVALID      |
      | 12345679990   | INVALID      |
      | 12345699990   | INVALID      |
      | 12345678900   | INVALID      |
      | 12345678995   | OK           |
      | 12345679998   | OK           |