//Create Trigger to call the OpoortunityTriggerHandler class
trigger OpportunityTrigger on Opportunity (before insert, before update) {
    //Call the validateOpportunity method from the OpportunityTriggerHandler class
    OpportunityTriggerHandler.validateOpportunity(Trigger.new);
}