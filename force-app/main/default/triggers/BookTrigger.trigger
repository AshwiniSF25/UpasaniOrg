trigger BookTrigger on Book__c (before insert) 
{
 	if(Trigger.isBefore)
    {
        Book.ProcessUpdates(Trigger.new);
    }
    
    
    
}