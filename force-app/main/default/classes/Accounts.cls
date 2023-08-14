public class Accounts 
{
    public static void processDelete(List<Account> acc)
    {
        for(Account a : acc)
        {
            if(a.CSA_Advisor__c == null)
            {
                throw new DmlException('You cannot delete');
            }
        }
    }

}

        // for (Account a : [SELECT Id FROM Account
        // WHERE Id IN (SELECT AccountId FROM Opportunity) AND
        // Id IN :Trigger.old]) 
        // {
        //     Trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
        // }