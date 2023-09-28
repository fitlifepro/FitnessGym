@isTest
public class Test_MemberTriggerHandler {
	@isTest
    public static void testData()
    {
        Trainer__c trainer = new Trainer__c(Name = 'Trainer1');
        insert trainer;
         Account account = new Account(Name = 'Member Account',	Phone = '9823454567',  Trainer__c = trainer.Id);
         insert account;
         account.Trainer__c = null; 
        update account;
        trainer = [SELECT Id, Count_of_Members__c FROM Trainer__c WHERE Id = :trainer.Id];
        System.assertEquals(0, trainer.Count_of_Members__c, 'Count_of_Members__c should be updated to 0');
     }
    
  
}