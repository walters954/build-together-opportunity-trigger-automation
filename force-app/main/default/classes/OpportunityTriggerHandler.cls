public with sharing class OpportunityTriggerHandler{
    public static void opportunityProductValidation(List<Opportunity> oppList){
        for (Opportunity opp : oppList){
            if (opp.StageName != 'Prospecting' && opp.OpportunityLineItems.size() == 0){
                opp.StageName.addError('At least one Opportunity Product is required when the Opportunity Stage is past "Prospecting".');
            }
        }
    }

}