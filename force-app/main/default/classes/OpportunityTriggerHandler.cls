public with sharing class OpportunityTriggerHandler{
    public static void opportunityProductValidation(List<Opportunity> oppList){
        for (Opportunity opp : oppList){
            if (opp.StageName == 'Prospecting'){
                continue;
            }
            List<OpportunityLineItem> lineItems = [SELECT Id
                                                   FROM OpportunityLineItem
                                                   WHERE OpportunityId = :opp.Id];
            if (lineItems.isEmpty()){
                opp.addError('At least one Opportunity Line Item is required for stage past Prospecting');
            }
        }
    }

}