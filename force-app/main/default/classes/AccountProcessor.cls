public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> recordIds)
    {
        List<Account> accounts = [Select Id, (select id from contacts) from Account Where Id IN :recordIds];
        for(Account a : accounts){
            a.Number_Of_Contacts__c = a.Contacts.size();
        }

        update accounts;
    } 
    
}