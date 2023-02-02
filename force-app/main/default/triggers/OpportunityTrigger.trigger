trigger OpportunityTrigger on Opportunity (before insert,before update) {
    if (Trigger.isInsert){
        System.debug('New Opp Inserted');
    }
    if (Trigger.isUpdate){
        System.debug('Opp updated');
    }


}