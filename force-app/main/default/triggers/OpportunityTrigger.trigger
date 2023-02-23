//Create Trigger to call the OpportunityTriggerHandler class
<<<<<<< HEAD
trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
        if (trigger.isInsert || trigger.isUpdate) {
    OpportunityTriggerHandler.validateOpportunity(Trigger.new);
        } if (trigger.After && Trigger.isUpdate) {
    OpportunityTriggerHandler.createRenewalOpps(Trigger.new);
    } else if (trigger.isAfter && Trigger.isInsert) {
    OpportunityTriggerHandler.setOpportunityAmount(Trigger.new);
=======
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
>>>>>>> dbe2ed2b6e9a0fab3a3e1278523a4894c57d0fb6
    }
}