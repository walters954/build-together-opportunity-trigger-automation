//Create Trigger to call the OpoortunityTriggerHandler class
trigger OpportunityTrigger on Opportunity (before insert, before update) {
    //Call the validateOpportunity method from the OpportunityTriggerHandler class
    OpportunityTriggerHandler.validateOpportunity(Trigger.new);
<<<<<<< HEAD
}
=======
}
>>>>>>> 53df081f2da63a0395839d5c95f38490acb74e97
