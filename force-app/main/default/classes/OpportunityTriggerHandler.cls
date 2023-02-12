public with sharing class OpportunityTriggerHandler {
    //Method called for before insert recieved passed in list of the records in Trigger.New
    public static void isBeforeInsert(List<Opportunity> triggerDotNew) {
        //Loop through the list of records.
        for(Opportunity opp : triggerDotNew){
            if(opp.StageName != 'Prospecting'){
                //Display error for inserting a record not in prospecting
                opp.StageName.addError('Newly created Opportunities have to be in "Prospecting".');
            }
        }
    }
    //Method called for before update recieving pass in list of the records in Trigger.new
    //Not passing in Trigger.oldMap and Trigger.newMap as we are not needing to check the previous context of an exact record. 
    public static void isBeforeUpdate(List<Opportunity> triggerDotNew){
        //Loop through the list of records.
        for(Opportunity opp : triggerDotNew){
            if(opp.StageName != 'Prospecting' && opp.StageName != 'Closed Lost' && !opp.HasOpportunityLineItem){
                //Display error for updating a record not in prospecting or closed won without a opportunity line item
                opp.StageName.addError('Please connect a product to save this record.');
            }else if(opp.StageName == 'Closed Won' && opp.HasOpportunityLineItem){
                Opportunity newOpp = opp.clone(false, false, false, false);
            }
        }
    }
}