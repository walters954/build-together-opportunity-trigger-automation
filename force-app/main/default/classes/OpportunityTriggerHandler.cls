public with sharing class OpportunityTriggerHandler {
    //Method called for before insert recieved passed in list of the records in Trigger.New
    public static void validateOpportunityOnInsert(List<Opportunity> triggerDotNew) {
        //Loop through the list of records.
        for(Opportunity opp : triggerDotNew){
            if(opp.StageName != 'Prospecting' && opp.StageName != 'Value Proposition'){
                //Display error for inserting a record not in prospecting
                opp.StageName.addError('Newly created Opportunities have to be in "Prospecting".');
            }
        }
    }
    //Method called for before update recieving pass in list of the records in Trigger.new
    //Not passing in Trigger.oldMap and Trigger.newMap as we are not needing to check the previous context of an exact record. 
    public static void validateOpportunityHasProducts(List<Opportunity> triggerDotNew){
        //Loop through the list of records.
        for(Opportunity opp : triggerDotNew){
            if(opp.StageName != 'Prospecting' && opp.StageName != 'Closed Lost' && !opp.HasOpportunityLineItem){
                //Display error for updating a record not in prospecting or closed won without a opportunity line item
                opp.StageName.addError('Please connect a product to save this record.');
            }
        }
    }
    public static void createMatchingRenewalOpportunity(List<Opportunity> triggerDotNew){

        List<Opportunity> renewalOpp = new List<Opportunity> ();

        //These two below added trying to connect them.
        List<OpportunityLineItem> renewalLineItems = new List<OpportunityLineItem>();
        Map<Id, Opportunity> clonedOppsMap = new Map<Id, Opportunity>();

        for(Opportunity opp : triggerDotNew){
            if(opp.StageName == 'Closed Won' && opp.HasOpportunityLineItem){
                Opportunity newOpp = opp.clone(false, true);
                newOpp.Name = opp.name + ' Renewal';
                newOpp.StageName = 'Value Proposition';
                newOpp.CloseDate = opp.CloseDate.addYears(1);
                renewalOpp.add(newOpp);
                clonedOppsMap.put(opp.Id, newOpp);
            }
        }
        if (!renewalOpp.isEmpty()) {

            insert renewalOpp;
            //This section currently breaks it
            List<OpportunityLineItem> oppLineItems = [SELECT Id, OpportunityId FROM OpportunityLineItem WHERE OpportunityId IN :triggerDotNew];
            for (OpportunityLineItem oppLineItem : oppLineItems) {
                Opportunity clonedOpp = clonedOppsMap.get(oppLineItem.OpportunityId);
                if (clonedOpp != null) {
                    OpportunityLineItem newLineItem = oppLineItem.clone();
                    newLineItem.OpportunityId = clonedOpp.Id;
                    renewalLineItems.add(newLineItem);
                }
            }
            insert renewalLineItems;
        }
    }
}