trigger OpportunityTrigger on Opportunity (before insert, before update){
    if ((Trigger.isBefore && Trigger.isInsert) || (Trigger.isBefore && Trigger.isUpdate)){
        OpportunityTriggerHandler.opportunityProductValidation(Trigger.new );
    }
}