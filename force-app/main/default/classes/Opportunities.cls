public class Opportunities 
{
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityByRecordTypeId(Id recordId, String recordTypeId)
    {
        system.debug('Hi, I was called');
        system.debug('Updated');
        system.debug('another Person updated this line');
        return [Select Id, Name, StageName, Amount, CloseDate, contactId, recordTypeId from Opportunity where contactId = : recordId and recordTypeId = : recordTypeId];
    }
}