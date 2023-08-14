@isTest
public  class LeadProcessorTest {
    

    @isTest
    public static void mytestmethod(){

        List<Lead> LeadRecords = new List<Lead>();

        for(Integer i=0; i<200; i++){
            lead le = new Lead();
            le.LastName='Test Sample' + i;
            le.Company='Sample';
            LeadRecords.add(le);
        }

        Database.insert(LeadRecords);

        test.starttest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        test.stoptest();

        System.assertEquals(200, [select count() from lead where leadSource = 'Dreamforce']);


    }

}