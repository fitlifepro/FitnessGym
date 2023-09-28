@isTest
public class TrainerDetailsTestClass {
@isTest
Public static void testGetTrainerListHandler() {
        
        List<Trainer__c> trainers = new List<Trainer__c>();
        for (Integer i = 0; i < 5; i++) {
            trainers.add(new Trainer__c(
                Name = 'Trainer ' + i,
                Email__c = 'trainer' + i + '@gmail.com',
                Last_Name__c = 'Lastname ' + i,
                Phone_Number__c = '123456789' + i
             ));
        }
        insert trainers;
       List<Trainer__c> result = TrainerController.getTrainerListHandler();
       System.assertEquals(5, result.size());
     }
}