public class MemberTriggerHandler {
    //Declaring the Context variable as Class level Variables
    List<Account> triggerNew;
    List<Account> triggerOld;
    Map<Id, Account> triggerNewMap;
    Map<Id, Account> triggerOldMap;
    
    //By creating constructor method, intializing Class level Variables as trigger context variables with type casting
    public MemberTriggerHandler()
    {
        triggerNew=(List<Account>)trigger.New;
        triggerOld=(List<Account>)trigger.Old;
        triggerNewMap=(Map<Id, Account>)trigger.NewMap;
        triggerOldMap=(Map<Id, Account>)trigger.OldMap;
    }
    
    //Entry Method
    Public void doAction()
    {
        Switch on Trigger.OperationType
        {
            when AFTER_INSERT
            {
                updateCountofMembers();
            }
            when AFTER_UPDATE
            {
                updateCountofMembers();
            }
            
        }
    }
    
    Public void updateCountofMembers()
    {
        List<Trainer__c> trainersList=[select id, Count_of_Members__c, (select id, Trainer__c from Members__r)  
                                       from Trainer__c ];
        List<Trainer__c> countToUpdate=new List<Trainer__c>();
        
        if(trigger.IsUpdate)
        {
            for(Account memRec:triggerNew)
            {
                if(triggerOldMap.get(memRec.Id).Trainer__c!=memRec.Trainer__c)
                {
                    for(Trainer__c trainerRec:trainersList)
                    {
                        trainerRec.Count_of_Members__c=trainerRec.Members__r.size();
                        countToUpdate.add(trainerRec);
                    }
                }
            }
                if(countToupdate.size()>0)
                {
                    update countToUpdate;
                }
            
        }else 
        {
            for(Trainer__c trainerRec:trainersList)
            {
                trainerRec.Count_of_Members__c=trainerRec.Members__r.size();
                countToUpdate.add(trainerRec);
            }
            if(countToupdate.size()>0)
            {
                update countToUpdate;
            }
        }
    }
}