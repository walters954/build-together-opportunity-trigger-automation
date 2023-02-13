trigger OpportunityTrigger on Opportunity ( before insert,before update, after update) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            OpportunityTriggerHandler.validateOpportunityOnInsert(trigger.new);
        }else if(trigger.isUpdate){
            OpportunityTriggerHandler.validateOpportunityHasProducts(trigger.new);
        }
    }else if(trigger.isAfter){
        if(trigger.isUpdate){
            OpportunityTriggerHandler.createMatchingRenewalOpportunity(trigger.new);
        }
    }
}
