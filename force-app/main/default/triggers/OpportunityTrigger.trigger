trigger OpportunityTrigger on Opportunity (before insert, before update) {

}


/*Okay so what I would like to do is split the trigger its functions into a separate class to keep our trigger "logic-less" as a best practice
We could have it split in the context and have one person write the insert and one write the update or one person write the test class one write the actually class.
Here is the salesforce docs on throwing an exception https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_exception_custom.htm
Would probably need a SOQL queryto check based on the id if it has a product or not [SELECT Bla (SELECT BLa FROM Bla) FROM Bla WHERE Id IN :trigger.new]
The relationship from Opportunity to Product is 
Opportunity > Price Book > Price Book Entry > Product */ 