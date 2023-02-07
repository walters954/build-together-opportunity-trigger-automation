//Declare a class to handle validation on the Opportunity record
public with sharing class OpportunityTriggerHandler {
    //Declare a method that takes a list of Opportunity records as input
    public void validateOpportunity(List<Opportunity> opportunities) {
        //Loop through each Opportunity record in the list
        for(Opportunity opp : opportunities) {
            //Check if the stage is not Prospecting and there are no OpportunityLineItems
            if(opp.StageName != 'Prospecting' && opp.OpportunityLineItems.size() == 0) {
                /* Add an error message to the Opportunity record to prevent it from being saved
                if there is no product associated */
                opp.addError('Opportunity must have at least one product when the stage is past Prospecting.');
            }
        }
    }
}