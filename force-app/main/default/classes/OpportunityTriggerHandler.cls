public with sharing class OpportunityTriggerHandler {
    public class MyException extends Exception {}

    public static void checkForStage(List<Opportunity> triggerDotNew) {
        //
        
        for(Opportunity opp : triggerDotNew){
            if(opp.StageName != 'Prospecting' && !opp.HasOpportunityLineItem){
                opp.StageName.addError(new myException('Please connect a product to save this record.'));
            }
        }
    }
}