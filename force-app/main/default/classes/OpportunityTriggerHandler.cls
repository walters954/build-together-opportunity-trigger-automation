public with sharing class OpportunityTriggerHandler{
    public static void opportunityProductValidation(List<Opportunity> oppList){
        List<OpportunityLineItem> lineItems = new List <OpportunityLineItem> ([SELECT Id, OpportunityId
                                                   FROM OpportunityLineItem
                                                   WHERE OpportunityId IN :oppList]);        // Check each opportunity in list Trigger.new for stage Prospecting and skip that opportunity
        
        System.debug(lineItems);
        for (Opportunity opp : oppList){
            if (opp.StageName == 'Prospecting'){
                continue;
            }
            // For any Opportunity with stage other than Prospecting fetch the products and store in a list
            if(lineItems.isEmpty()) { // If the Product list is empty for the Opportunities with stage other than Prospecting,thrown the error
                opp.addError('At least one Opportunity Line Item is required for stage past Prospecting');
            }
        }
    }

}