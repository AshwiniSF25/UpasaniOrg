@isTest
public class DailyLeadProcessorTest 
{
private static string cron_exp = '0 0 0 ? * * *'; //midnight

    @isTest
    public static void mytest()
    {
        List<Lead> RecLeads = new List<Lead>();

        for(Integer i=0; i<200; i++)
        {
            Lead le = new Lead();
            le.Lastname= 'Sample';
            le.company='sam';

            RecLeads.add(le);
        }

        Database.insert(RecLeads);

        Test.StartTest();
        DailyLeadProcessor dlp = new DailyLeadProcessor();
        String jobId = System.schedule('Process Leads', cron_exp, dlp);
        Test.StopTest();

        // List<Lead> checkupdate = [Select Id from Lead where LeadSource= 'Dreamforce'];
        // system.assertequals(200, checkupdate.size());

    }
}