Feature: US263923 COKYC: Control Individual PEP

Description:

	User validates fields for Control Individual PEP

@ClientOnboarding @regression @ignore
Scenario Outline: TC01 User valdiates fields for Control Individual PEP
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
Then User validates fields are present
| Field                                            |
| Is the Control Individual a politically Exposed? |
| Identification Method                            |
And User validates field is not present
| Field                |
| Percentage Ownership |
And User validates fields are not populated for "Is the Control Individual a politically Exposed?" as "No"
| FieldList                | Text                                                                                                                               |
| PoliticallyExposedFields | Please note: The Client will be treated as High-Risk,Will require Team Lead/Manager and ROM/DOM approval prior to High-Risk Review |
And User validates dependency fields for "Is the Control Individual a politically Exposed?" as "Yes"
| CountryofResidence | RelationshipOfClientPositionholder | FamilyRelation | PositionHeldTitle | CurrentlyHoldingPosition | PositionEndDate | FieldList                | Text                                                                                                                               |
| Afghanistan        | Family                             | Relation       | Manager           | No                       | Today           | PoliticallyExposedFields | Please note: The Client will be treated as High-Risk,Will require Team Lead/Manager and ROM/DOM approval prior to High-Risk Review |
And User validates fields are not populated for "Currently Holding Position?" as "Yes"
| Field               |
| CurrentlyHoldFields |
And User validates fields are not populated for "Currently Holding Position?" as "No"
| Field               | PositionEndDate |
| CurrentlyHoldFields | Today           |
And User validates depedency fields for "Relationship of client to positionholder"
| Position        | DependencyField          |
| Self            |                          |
| Family          | Family Relation          |
| Close Associate | Close Associate Relation |
And User validates Help Text for fields
| Field                                            | Helptext                      |
| Is the Control Individual a politically Exposed? | Politically Exposed Help Text |
And User validates Approver fields are not populated
| Field                      |
| Team Lead/Manager Approver |
| ROM/DOM Approver           |
| Approval Date              |
| ROM/DOM Approval Date      |

Examples: 

| UserType           |
| Sales Colleague    |
| PB User            |
| BU Admin           |
| CB Sales Colleague |

@ClientOnboarding @regression
Scenario Outline: TC02 User validates Identification Method picklists
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
And User performs "+ Add Identification" operation
Then User validates "Identification Method" has below picklist value
| PickListValue                              |
| Unexpired Photo ID                         |
| LexisNexis (Non-Documentary)               |
| WorldCheck (Non-Documentary)               |
| Student ID (Minors)                        |
| Waive ID Requirement (Minors)              |
| Other (Elderly or Disabled w/o Photo ID)   |
| Other (Member of Certain Religious Groups) |
And User selects "Unexpired Photo ID" as "Identification Method"
And User validates fields are populated
| Field              |
| Primary ID         |
| ID Number          |
| ID Expiration Date |
| ID Issue Date      |
And User validates "Primary ID" has below picklist value
| PickListValue                    |
| Driver License                   |
| State-Issued ID                  |
| Military Photo ID                |
| Passport(U.S. or Foriegn Issued) |
| US Permanent Resident Alien Card |
| Foreign Issued Visa              |
| Canadian Driver’s license        |
| Matricula/Consular Card          |
| Foreign Issued Documentation     |

Examples: 

| UserType           |
| Sales Colleague    |
| PB User            |
| BU Admin           |
| CB Sales Colleague |




@ClientOnboarding @regression
Scenario Outline: TC03 User validates Identification Method picklists for Driver License
Given User logs into SalesCloud as '<UserType>' User
And User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
When User adds identification details
		| AddButton            | IdentificationMethod | PrimaryID      | IDNumber | IDIssuingState | IDIssueDate | IDExpirationDate | SelectButton |
		| + Add Identification | Unexpired Photo ID   | Driver License | 1234567  | Alaska         | May 3, 2021 | May 1, 2030      | Save         |
Then User validates identification details are saved
		| IDType        | IDNumber | IDIssuingState | IDIssueDate | IDExpirationDate |
		| DriverLicense | 1234567  | Alaska         | 2021-05-03  | 2030-05-01       |


Examples: 

| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC04 User validates Identification Method picklists for Canadian Driver’s license
Given User logs into SalesCloud as '<UserType>' User
And User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
When User adds identification details
	| AddButton            | IdentificationMethod | PrimaryID                 | IDNumber | IDIssueDate | IDExpirationDate | SelectButton |
	| + Add Identification | Unexpired Photo ID   | Canadian Driver’s license | 123456   | May 3, 2021 | May 1, 2030      | Save         |
Then User validates identification details are saved
	| IDType                    | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate |
	| Canadian Driver’s license | 123456   | Canada           | 2021-05-03  | 2030-05-01       |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC05 User validates Identification Method picklists for Passport
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
And User adds identification details
	| AddButton            | IdentificationMethod | PrimaryID                        | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate | SelectButton |
	| + Add Identification | Unexpired Photo ID   | Passport(U.S. or Foriegn Issued) | 31234567 | United States    | May 3, 2021 | May 1, 2030      | Save         |
Then User validates identification details are saved
	| IDType   | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate |
	| Passport | 31234567 | United States    | 2021-05-03  | 2030-05-01       |
Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC06 User validates Identification Method picklists for Military Photo ID
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
Then User adds identification details
	| AddButton            | IdentificationMethod | PrimaryID                        | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate | SelectButton |
	| + Add Identification | Unexpired Photo ID   | Military Photo ID | 31234567 | United States    | May 3, 2021 | May 1, 2030      | Save         |
And User validates identification details are saved
	| IDType            | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate |
	| Military Photo ID | 31234567 | United States    | 2021-05-03  | 2030-05-01       |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC07 User validates Identification Method picklists for US Permanent Resident Alien Card
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
Then User adds identification details
	| AddButton            | IdentificationMethod | PrimaryID                        | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate | SelectButton |
	| + Add Identification | Unexpired Photo ID   | US Permanent Resident Alien Card | 31234567 | United States    | May 3, 2021 | May 1, 2030      | Save         |
And User validates identification details are saved
	| IDType                           | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate |
	| US Permanent Resident Alien Card | 31234567 | United States    | 2021-05-03  | 2030-05-01       |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC08 User validates Identification Method picklists for Foreign Issued Visa
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
Then User adds identification details
	| AddButton            | IdentificationMethod | PrimaryID           | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate | SelectButton |
	| + Add Identification | Unexpired Photo ID   | Foreign Issued Visa | 31234567 | India            | May 3, 2021 | May 1, 2030      | Save         |
And User validates identification details are saved
	| IDType              | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate |
	| Foreign Issued Visa | 31234567 | India            | 2021-05-03  | 2030-05-01       |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC09 User validates Identification Method picklists for Foreign Issued Documentation
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
Then User adds identification details
	| AddButton            | IdentificationMethod | PrimaryID                          | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate | SelectButton |
	| + Add Identification | Unexpired Photo ID   | Foreign Issued Documentation | 31234569 | India            | May 3, 2021 | May 1, 2030      | Save         |
And User validates identification details are saved
	| IDType                       | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate |
	| Foreign Issued Documentation | 31234569 | India            | 2021-05-03  | 2030-05-01       |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |


@ClientOnboarding @regression
Scenario Outline: TC10 User validates Identification Method picklists for Matricula/Consular Card
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
Then User adds identification details
	| AddButton            | IdentificationMethod | PrimaryID               | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate | SelectButton |
	| + Add Identification | Unexpired Photo ID   | Matricula/Consular Card | 31234569 | India            | May 3, 2021 | May 1, 2030      | Save         |
And User validates identification details are saved
	| IDType                  | IDNumber | IDIssuingCountry | IDIssueDate | IDExpirationDate |
	| Matricula/Consular Card | 31234569 | India            | 2021-05-03  | 2030-05-01       |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC11 User validates Identification Method - Other (Elderly or Disabled w/o Photo ID)
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
Then User validates identification details
	| AddButton            | IdentificationMethod                     | PrimaryID1           | SecondaryList1 | PrimaryID2             | SecondaryList2 |
	| + Add Identification | Other (Elderly or Disabled w/o Photo ID) | Social Security Card | SSC Picklist   | Medicare/Medicaid Card | MMC Picklist   |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC12 User validates Identification Method - Students/Waive ID
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
	| Tab              |
	| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
Then User clicks '+ Add Identification' button
And User provides required data for identification
	| IdentificationMethod          | PrimaryID  | Approver |
	| Students ID (Minors)          | Student ID | Lynice   |
	| Waive ID Requirement (Minors) |            | Lynice   |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC13 User validates Identification Method - Other (Member of Certain Religious Groups)
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
	| Tab              |
	| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
And User adds Religious Group identification details
	| AddButton            | IdentificationMethod                       | 
	| + Add Identification | Other (Member of Certain Religious Groups) | 
Then User validates "Primary ID" pick list has below options
	| OptionList                        |
	| ReligiousIdentityPrimaryIDOptions |
And User validates "Secondary ID" pick list has below options
	| OptionList                        |
	| ReligiousIdentityPrimaryIDOptions |

Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |

@ClientOnboarding @regression
Scenario Outline: TC14 User validates Identification Method - LexisNexis/ WorldCheck
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
	| Tab              |
	| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
And User adds identification details
	| AddButton            | IdentificationMethod   | Date Ran     | SelectButton |
	| + Add Identification | <IdentificationMethod> | Apr 12, 2020 | Save         |
Then User validates identification details are saved
	| IDNumber |
	| Random   |

Examples: 
| UserType        | IdentificationMethod         |
| Sales Colleague | LexisNexis (Non-Documentary) |
| PB User         | LexisNexis (Non-Documentary) |
| Sales Colleague | WorldCheck (Non-Documentary) |
| PB User         | WorldCheck (Non-Documentary) |

@ClientOnboarding @regression
Scenario Outline: TC15 User validates fields for Identification Discrepancy
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
	| Tab              |
	| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton | AccountDetails     |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       | Control Individual |
And User navigate to "Identification Information" section
And User selects identification discrepancy
	| InformationDiscrepancyEncountered | 
	| Yes                               | 
Then User validates identification discrepancy
	| DiscrepancyResolved | DescribeDiscrepancy |
	| Yes                 | Resolved            |
And User validates identification discrepancy
	| DiscrepancyResolved | DiscrepancyNotResolvedError                                                                                               |
	| No                  | Cannot onboard until discrepancy is resolved. Please submit an Unusual Transaction Report if unable to resolve or verify. |


Examples: 
| UserType           |
| Sales Colleague    |
| PB User            |


@ClientOnboarding @regression
Scenario Outline: TC16 User valdiates validation rules on mandatory fields
Given User logs into SalesCloud as '<UserType>' User
When User performs below mentioned process
	| Section  |
	| Accounts |
And User creates account and validates Begin Onboarding
	| AccountType     | AccountName | introductionChannel | Phone      | street              | city        | state      | zip   | firstName | lastName |
	| Prospect Entity | A           | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California | 90012 |           |          |
And User navigates to Tab
| Tab              |
| Beneficial Owner |
And User adds control Individual with details
	| ClientSelect          | ClientOption      | InterestClient | Button                   |
	| Financial Institution | None of the Above | Yes            | + Add Control Individual |
And User adds new Control Individual
	| CreateButton | FirstName | LastName | introductionChannel | Phone      | street              | city        | StateProvince | zip   | AddButton |
	| + Create New | T         | U        | Self Identified     | 9198888888 | 555 S Flower Street | Los Angeles | California    | 90012 | Add       |
#And User performs "Submit for CIS" activity
#Then User validates the error messages for mandatory fields
#| Message           |
#| Unable to Proceed |
And User performs "Save & Continue" activity
And User navigates to next tab 
| tabName           |
| Product Selection |

Examples: 

| UserType           |
| Sales Colleague    |
| PB User            |

