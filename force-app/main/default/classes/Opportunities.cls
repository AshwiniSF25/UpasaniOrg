public class Opportunities 
{
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityByRecordTypeId(Id recordId, String recordTypeId)
    {
        system.debug('Hi, I was called');
        return [Select Id, Name, StageName, Amount, CloseDate, contactId, recordTypeId from Opportunity where contactId = : recordId and recordTypeId = : recordTypeId];
    }
}