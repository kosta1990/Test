@BNS @Web
Feature: BNS Script

@BNS_Scotia_ConsignmentCage_BuyOrder
 Scenario: BNS_Scotia_ConsignmentCage_BuyOrder
		   Given I launch external url for  "Scotia"
		   When I login with "Consignment Cage" user
		   And  I begin order   
		   And  I select ship inventory to intria 
		   And  I select consignment type as "Consignment"
		   And  I click on ADD Currency for Consignement Cage
		   Then I verify Buy and Sell Currency screen 
		   When I select currency as "Australia (AUD)"
		   And I enter Amount as "10"
		   And I click on Add To Order   
		   When I click  review button
		   Then I verify Order Submit Page 
	#	   When I cancel Order  
	#	   Then I verify begin order page 
		    
#		   When I submit the purchase order
#		   Then The OFCWL order should be placed successfully
@BNS_Scotia_NonConsignmentCage_BuyOrder
 Scenario: BNS_Scotia_NonConsignmentCage_BuyOrder
           Given I launch external url for  "Scotia"
		   When I login with "Consignment Cage" user
		   And  I begin order   
		   And  I select ship inventory to intria 
		   And  I select consignment type as "Non Consignment"
		   And  I click on ADD Currency for Consignement Cage
		   Then I verify Buy and Sell $ Currency screen 
		   When I select currency as "Europe (EUR)" 
		   And I enter Amount as "10"
		   And I click on # Add # To Order   
		   When I  # click  review button
		   Then I verify Order Submit Page 
	#	   When I cancel Order  
	#	   Then I verify begin order page 
		   
@BNS_Scotia_ConsignmentCage_SellOrder		   
 Scenario: BNS_Scotia_ConsignmentCage_SellOrder
           Given I launch external url for  "Scotia"
		   When I login with "Consignment Cage" user
           When I begin order   
		   And  I select order inventory to intria 
		   And  I select %consignment type as "Consignment"
		   And  I click on ADD Currency for Consignement Cage
		   Then I verify Buy and Sell Currency screen 
		   When I select currency as "Australia (AUD)"
		   And I enter Amount as "10"
		   And I click on Add To Order   
		   When I click  review button
		   Then I &verify Order Submit Page 
	#	   When I cancel Order  
	#	   Then I verify begin order page 

When I submit the purchase order
		   Then The OFCWL order should be placed successfully