trigger OpportunityTrigger on Opportunity ( before insert,before update) {
    //Checks the trigger context.
    if(trigger.isInsert && trigger.isBefore) {
        //Calls the correct method based on context. 
        OpportunityTriggerHandler.isBeforeInsert(trigger.new);
    //Checks the trigger context.
    }else if(trigger.isUpdate && trigger.isBefore){
        //Calls the correct method based on context. 
        OpportunityTriggerHandler.isBeforeUpdate(trigger.new);
    }
}