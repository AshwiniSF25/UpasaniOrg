public class UpdateContactAddresses implements Database.Batchable<sObject>, Database.Stateful 
{
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator(
            'SELECT ID FROM Account Where BillingCountry = \'USA\''
        );
    }

    public void execute(Database.BatchableContext bc, List<Account> scope)
    {
        // process each batch of records
        
        delete scope;
    }


    public void finish(Database.BatchableContext bc)
    {
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];

        system.debug(job);
        
       
    }
}