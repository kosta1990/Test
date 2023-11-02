Feature: LifeSpeed




@TEST0001
Scenario Outline: (LifeSpeed-Lincoln TermAccel_Semi-Annual (tiwce a year)_Direct Billing
Given User is in Lifespeed screen
When User is on Life Speed Product Selection Page
Then Below mentioned details should be captured successfully in Life Speed
|Product Selection Section|
|BIN|
|ECI|
|Solicitation State|
|Solicitation City|
|Product Type|
|Insurance Carrier|
|Product|
When User select policy term as <Term> and enter insurance amount >= $750,000
When Rider is <Riders> , where default value selected is 'Accelerated Benefit Rider'
When User is on Owner section, where owner details are pre-filled and non-editable
And user selects the Payor as <Payor>
When User select Policy purpose as <purpose>
Then Policy Purpose should be selected successfully
When User is on Primary Insured Details screen
Then Below mentioned details should be captured successfully in Primary Insured Detail Screen
|Primary Insured Information|
|	First Name and Last Name|
|	Underwriting Class |
|	Social Security Number |
|	Gender|
|	Date of Birth|
|	Marital Status|
|	Number of Dependents|
|	Country of Citizenship|
|	Birth Country|
|	Birth State|
|Primary Insured Address|
|	Phone Number|
|	Physical Street Address|
|	Address Line 1|
|	Address Line 2|
|	City|
|	State|
|	ZIP|
|	Country|
|Mailing Address|
|	Address Line 1|
|	Address Line 2|
|	City|
|	State|
| Zip|
|	Country|
|Phone Numbers|
|	Home Phone Number|
|	Work Phone Number|
|	Mobile Phone Number|
|	Fax Number|
|	International Number|
|	Preferred Phone|
When User selects underwriting class as <Underwriting Class>
When User selects <Paid with Fund from Person/Entity> for the field 'Is this policy being paid for with funds from any person or entity'
When User is on Beneficiary Details screen
Then Below mentioned Beneficiary Details should be captured successfully
|Primary Beneficiary Designation |
|First Name|
|Last Name|
|Date Of Birth|
|Country of Citizenship|
|Relationship with Primary Insured|
|Beneficiary % (Whole Percent)|
|SSN/Tax ID|
|Primary Address|
|Address Line 1|
|Address Line 2|
|State|
|ZIP|
|Country|
|Phone Numbers|
|Home Phone Number|
When User clicks on Next
Then Financial Details screen is displayed
When User is on financial details screen
Then Source of Wealth question should be prefilled and non-editable
When User selects Source of Funds as <Source Of Fund>
When User selects Surrender Charge or Penalty for any Source of Funds as <Surrender Charges>
When User selects the envision taking a loan as <Loan>
When User select Federal Tax Bracket as <TaxBracket>
When User selects Risk Tolerance as <Risk Tolerance>
When User choose Investment Objectives as <Investment Objectives>
When User selects Time Horizon as <Time Horizon>
When User select investment experience as <Investment Exp>
And Enters a value in corresponding 'Start year' field(s).
When User enters income amount for below fields under 'Earned/Passive Income section
 |Wages|
 |Personal Investment|
 |Rental Income|
 |Pension|
 |Social Security|
 |Other (Alimony, Unemployment Income etc)|
 |Total Annual Income|
And enters expense amount for below fields
 |Living Expenses (e.g. Food, medical, gasoline, insurance, property, taxes etc)|
 |Fixed debt expenses (e.g. car loans, mortage, otherfixed loans)|
 |Variable debt expenses (e.g. Credit cards, line of credits)|
 |Discretionary Expenses (e.g clothes, extertainment)|
 |Total Monthly Expenses|
 |Total Annual Expenses|
And enters the asset value in below fields
 |Liquid Net worth (e.g cash, checking, savings, money market)|
 |Variable Annuity|
 |Fixed Annuity|
 |Index Annuity|
 |Mutual Funds|
 |Equities|
 |Bonds, CDs>1year|
 |Employer Sponsored Retirement Plan|
 |Other Brokerage (e.g. options, commodities, alternate investments, etc.)|
 |Total Investable Assets|
 |Business, Trust, Real Estate, Other|
 |Total Net Worth|
And enter Policy face value and premium details
 |Face Value of any permanent Life Insurance|
 |Premium for this Policy (ANNUAL)|
 |Total Premiums on all in-force life insurance policies (ANNUAL)|
 |Proposed total life insurance premium (ANNUAL)|
And select 'financial situation including income, expenses, debt or life events' value as <Change to Financial Situation>
Then Financial Information completes
When Choose <acceptnon-guaranteedelements> for accept non-guaranteed elements
Then Additional field 'If Yes, Please Explain' appears
When choose <reversemortgage> for reverse mortgage
And clicks on Next
Then Payment screen opens
When User is in Scheduled Premium screen
And User select " <Frequency of modal premium> " as Frequency of modal premium
When Payment method is selected as <Payment Method>
When User selects <Aviation Activity> for the field 'Answer only if the Proposed Insured(s) participate(s) in aviation activities'
Then Participate(s) in aviation activities completes
When User checks the checkbox labelled 'I have reviewed with the Proposed Insured each question on the application. For those questions asked by me, the answers have been recorded exactly as stated....'
And Clicks Next
Then Pop-up window 'Ready to Validate notification' with Ok and Validate button should be displayed.
When User selects <Borrow> for using or borrowing funds from your existing policies
And And selects <Discontinue> for 'Discontinuing making premium payments, surrendering'
And User selects <Exsiting Policy> for question 'Does the proposed insured have existing life insurance'
When User clicks 'Add Instance' button
Then 'Other Existing Insurance Information 2' section is displayed
And User fills all mandatory fields to proceed further.
When User selects <Pending LTC> for 'Other Pending LTC Insurance' question.
When User select <input> for Long-Term Care insurance surrendered
When User selects <Penalties or Surrender Charges> for the field 'Will there be penalties or surrender charges..'
And User selects <Adverse Tax Consequences> for the field 'Are there adverse tax consequences...'
When Clicks Next
Then Agent Report screen is displayed with pre-populated data.
When User fills all the required fields for Agent Report
And clicks Next
Then Suitability/Supervision screen is displayed.
When User enters value for the field 'The purpose of the insurance is listed as long-term care or deferred compensation'
And Clicks Next
Then Pop-up window with below text should be displayed. ***You have completed the first part of the application. The second part of the application that covers any carrier-specific questions and risk questions are pending. This part is covered on the Carrier Additional Information screen. At this point, you can assign the application to BGA to complete the second part by clicking on the "Assign to BGA" button available on the top of the screen. Once you click on Assign to BGA button, the application will be assigned to BGA and BGA will be notified. You can continue to work on the application after you assign this application to BGA if you prefer or can come out of this application.****
When User clicks Ok button
Then Carrier questions are dispalyed.
When User selects <Special Dating> for the question 'Will this policy require special dating?'
And Selects <Dating Type>
When User selects <Justify The Covg Applied> for the question '..spouse/domestic partner to justify the coverage applied?'
When User selects <Interview Type> for 'Client Interview Type'
And Selects <E-Signature> for 'Select Authentication method for Agent signature'
And Enters a value for the field 'How long have you known the Proposed Insured?'
When User selects <Relation to Proposed Insured> for field 'Are you related to the Proposed Insured?'
And Selects <Read/Understand English> for the field 'Read and Understand English'
And Enters a value for 'How was the application completed?'
And Selects any of the below values for 'Time Zone of Primary Insured'
| ET |
| CT |
| MT|
| PT |
| AK |
| HI |
And Enters a value for 'Primary Insured Secondary Phone (Cell or Landline)'
When User selects <Pol Paid with Finance Loan> for question 'Is this policy being paid for with a premium financing loan?'
When User selects <LifeCom Check/Uncheck>
When User clicks 'Validate'
Then Validate completes with pop-up message as 'eSignature Eligibility'
When User selects Opt-Out
Then Application submission is proceed with informational mesasge as "This application is currently in Awaiting eSignature status. No changes are permissible at this moment."




