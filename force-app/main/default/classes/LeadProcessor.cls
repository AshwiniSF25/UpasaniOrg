public  class LeadProcessor implements Database.Batchable<sObject>
{ 
    //Batch apex : Start, execute, Finish 
    //start
    public Database.QueryLocator start(Database.BatchableContext bc) 
    {
        return Database.getQueryLocator([Select Id, Name from Lead]); 
    }

    //Execute
    public void execute(Database.BatchableContext bc, List<Lead> allLeadsOrg)
    {
        List<Lead> leadstoupdate = new List<Lead>();
        for (Lead le : allLeadsOrg) 
            {
            le.leadSource = 'Dreamforce';
            leadstoupdate.add(le);   
            }
        update leadstoupdate;
    }

    //Finish 
    public void finish(Database.BatchableContext bc){
        System.debug('Donee');
    }

}