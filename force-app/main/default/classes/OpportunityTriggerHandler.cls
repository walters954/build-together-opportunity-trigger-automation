public with sharing class OpportunityTriggerHandler{
    public static void opportunityProductValidation(List<Opportunity> oppList){
        List<OpportunityLineItem> lineItems = new List <OpportunityLineItem> ([SELECT Id, OpportunityId
                                                   FROM OpportunityLineItem
                                                   WHERE OpportunityId IN :oppList]);        // Check each opportunity in list Trigger.new for stage Prospecting and skip that opportunity
        
        System.debug(lineItems);
        Map<String,List<OpportunityLineItem>> lineItemsByOpportunityId = getLineItemsByOpps();
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

    //Common apex pattern
    //Mapping id to list of records
    private static Map<String,List<OpportunityLineItem>> getLineItemsByOpps(List<OpportunityLineItem> lineItems){
        Map<String,List<OpportunityLineItem>> lineItemMap = new Map<String,List<OpportunityLineItem>>();

        for (OpportunityLineItem lineItem : lineItems){
            List<OpportunityLineItem> tempLineItems = lineItemMap.get(lineItem.OpportunityId); //return null or list depending on the opprotunity it

            //check if there is an existing lists related to the opportunity
            //Create a list if there no is 
            if (tempLineItems == null){
                tempLineItems = new List<OpportunityLineItem> ();
            }

            tempLineItems.add(lineItem); //Add line items into the list
            lineItemMap.put(lineItem.OpportunityId, tempLineItems); //put the list inside of map with opportunity id as the key
        }

        return lineItemMap;
    }

}