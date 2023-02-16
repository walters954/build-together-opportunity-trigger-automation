public with sharing class OpportunityTriggerHandler {
    //Method to validate opportunities
    public static void validateOpportunity(List<Opportunity> oppList) {
        //Loop through each Opportunity record in the list
        List <OpportunityLineItem> lineItem = new List <OpportunityLineItem> ([SELECT Id, OpportunityId
            FROM OpportunityLineItem
            WHERE OpportunityId IN : oppList]);
        for(Opportunity opp : oppList) {
            //Check if the stage is not Prospecting and there are no OpportunityLineItems
            if (lineItem.isEmpty() && opp.StageName != 'Prospecting'){
                /* Add an error message to the Opportunity record to prevent it from being saved
                if there is no product associated */
                opp.addError('Opportunity must have at least one product when the stage is past Prospecting.');
            }
        }
    }

    //Method to create renewal opportunities
    public static void createRenewalOpps(List<Opportunity> opportunitiesR){  
        //Create a list to store the new renewal opportunities
        List<Opportunity> renewalOpps = new List<Opportunity>();  
        //Create a variable to store the query result
        //Look into for loop
        Map<Id, Opportunity> opportunitiesMap = new Map<Id, Opportunity>([
                //Query Opportunities with certain fields and child records 
                SELECT Id, Name, AccountId, CloseDate, 
                (SELECT Id, Quantity, TotalPrice, Product2Id
                FROM OpportunityLineItems) 
                FROM Opportunity 
                WHERE Id IN :opportunitiesR AND IsWon = true]);
            //Loop through each Opportunity record in the query result
            for (Opportunity opp : opportunitiesMap.values()) {
                //Create a new Renewal Opportunity record and add it to the list
                Opportunity renewalOpportunity = new Opportunity(
                Name = 'Renewal - ' + opp.Name,
                AccountId = opp.AccountId,
                StageName = 'Value Proposition',
                CloseDate = opp.CloseDate.addYears(1),
                Parent_Opportunity__c = opp.Id);
            
            renewalOpps.add(renewalOpportunity);
        }
        //If there are renewal opportunities, insert them into the database
        if (!renewalOpps.isEmpty()) {
            insert renewalOpps;
        }
    }
}