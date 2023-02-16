public with sharing class OpportunityTriggerHandler {
    public OpportunityTriggerHandler() {
        System.debug(Trigger.operationType);
        System.debug(Trigger.new.size());
    }

    public void beforeInsert(List<Opportunity> newOpportunitys) {
        System.debug('beforeInsert');
    }
    public void beforeUpdate(List<Opportunity> oldOpportunitys, List<Opportunity> newOpportunitys, Map<ID, SObject> oldOpportunityMap, Map<ID, SObject> newOpportunityMap) {
        System.debug('beforeUpdate');
    }
    public void beforeDelete(List<Opportunity> oldOpportunitys, Map<ID, SObject> oldOpportunityMap) {
        System.debug('beforeDelete');
    }
    public void afterInsert(List<Opportunity> newOpportunitys, Map<ID, SObject> newOpportunityMap) {
        System.debug('afterInsert');
    }
    public void afterUpdate(List<Opportunity> oldOpportunitys, List<Opportunity> newOpportunitys, Map<ID, SObject> oldOpportunityMap, Map<ID, SObject> newOpportunityMap) {
        System.debug('afterUpdate');
    }
    public void afterDelete(List<Opportunity> oldOpportunitys, Map<ID, SObject> oldOpportunityMap) {
        System.debug('afterDelete');
    }
    public void afterUndelete(List<Opportunity> newOpportunitys, Map<ID, SObject> newOpportunityMap) {
        System.debug('afterUndelete');
    }
}