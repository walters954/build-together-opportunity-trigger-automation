//Create Trigger to call the OpportunityTriggerHandler class
trigger OpportunityTrigger on Opportunity (before insert, before update, after update) {
    if (trigger.isBefore){
        if (trigger.isInsert || trigger.isUpdate){
    //Call the validateOpportunity method from the OpportunityTriggerHandler class
    OpportunityTriggerHandler.validateOpportunity(Trigger.new);
        } else if (trigger.isInsert) {
            if (trigger.isAfter){
    OpportunityTriggerHandler.createRenewalOpps(Trigger.new);
    }
    }
    //testing
    //adding another
}
}