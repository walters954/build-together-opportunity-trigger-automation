trigger OpportunityTrigger on Opportunity(before insert, before update ){
    OpportunityTriggerHandler.opportunityProductValidation(Trigger.new );
}