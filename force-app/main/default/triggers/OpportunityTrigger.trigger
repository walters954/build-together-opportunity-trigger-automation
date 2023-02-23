//Create Trigger to call the OpportunityTriggerHandler class
trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
        if (trigger.isInsert || trigger.isUpdate) {
    OpportunityTriggerHandler.validateOpportunity(Trigger.new);
        } if (trigger.isAfter && Trigger.isUpdate) {
    OpportunityTriggerHandler.createRenewalOpps(Trigger.new);
    } else if (trigger.isAfter && Trigger.isInsert) {
    OpportunityTriggerHandler.setOpportunityAmount(Trigger.new);
    }
}