trigger AccountDeletion on Account (before delete) 
{
    // Prevent the deletion of accounts if they have related opportunities.
    
    Accounts.processDelete(Trigger.old);
}