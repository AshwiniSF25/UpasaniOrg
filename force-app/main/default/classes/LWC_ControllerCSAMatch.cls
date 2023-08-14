public class LWC_ControllerCSAMatch 
{
    @AuraEnabled(cacheable=true)
    public static List<CSA_Data__c> getCSAMatches(Id recordId)
    {
        Contact con = [select Id,Name from Contact where Id =:recordId];
        CSA_Data__c[] csa = [select Id,Name from CSA_Data__c where Name Like :con.Name];
        system.debug(csa);

        return csa;
    }
  


}