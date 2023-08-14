public class DailyLeadProcessor implements Schedulable
{
    //execute
    public void execute(SchedulableContext ctx) 
    {
    
        List<Lead> LRecords = [Select Id, LeadSource from Lead where LeadSource = null];

        for(Lead le : LRecords)
        {
            le.LeadSource= 'Dreamforce'; 
        }

        Database.update(LRecords);
    }


}