trigger OpportunityTrigger on Opportunity ( before insert,before update, after update) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            OpportunityTriggerHandler.isBeforeInsert(trigger.new);
        }else if(trigger.isUpdate){
            OpportunityTriggerHandler.isBeforeUpdate(trigger.new);
        }
    }else if(trigger.isAfter){
        if(trigger.isUpdate){

        }
    }
}
