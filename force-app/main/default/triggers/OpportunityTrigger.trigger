trigger OpportunityTrigger on Opportunity (before insert, before update){
    if (Trigger.isBefore) {
       if( Trigger.isInsert || Trigger.isUpdate) {
        OpportunityTriggerHandler.opportunityProductValidation(Trigger.new);
       }         
    } else if (Trigger.isAfter){
        if (Trigger.isInsert){
            System.debug('after insert');
        }
    }
}