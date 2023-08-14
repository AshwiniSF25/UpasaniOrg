trigger Students on Student__c (before insert) 
{
    StudentsApex.processBefore(Trigger.new);   
}