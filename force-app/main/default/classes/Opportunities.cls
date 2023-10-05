public class Opportunities 
{
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityByRecordTypeId(Id recordId, String recordTypeId)
    {
        system.debug('Hi, I was called');
        system.debug('Updated');
        system.debug('another Person updated this line');
<<<<<<< HEAD
        system.debug('another Person updated this line2');

=======
        system.debug('Ash from window');
>>>>>>> b67dbbed61cc74d94fc702052d6991d1e56a7692
        return [Select Id, Name, StageName, Amount, CloseDate, contactId, recordTypeId from Opportunity where contactId = : recordId and recordTypeId = : recordTypeId];
    }
}