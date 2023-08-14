@isTest
public  class AddPrimaryContactTest {
   
    @isTest
    public static void mymethodTest()
    {

       List<Account> accRecords = new List<account>();
       for(Integer i=0; i<50; i++)
       {
        Account ac = new Account();
        ac.Name = 'Test Sample'+ i;
        ac.BillingState ='NY';
        accRecords.add(ac);
       }
       
       for(Integer j=50; j<100; j++)
       {
        Account ac = new Account();
        ac.Name = 'Test Sample'+ j;
        ac.BillingState ='CA';
        accRecords.add(ac);
       } 

       Database.insert(accRecords);


       Contact c = new Contact (firstname='sim', lastname='con');
       insert c; 

       Test.StartTest();
       AddPrimaryContact apc = new AddPrimaryContact(c,'CA');
       Id jobId = System.enqueueJob(apc);
       Test.StopTest();


       List<contact> cons = [Select Id from contact where contact.account.BillingState = 'CA'];
       system.assertequals(200, cons.size());

    }
}