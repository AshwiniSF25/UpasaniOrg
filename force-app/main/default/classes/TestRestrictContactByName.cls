@isTest
public class TestRestrictContactByName {
   
    @isTest 
    public static void TestContact() {
        // Test data setup
        
        Contact con1 = new Contact(FirstName='Ashwini', lastname= 'INVALIDNAME');
        insert con1;
        // Perform test

        Test.startTest();
        Database.insert(con1, false);
        Test.stopTest();

       
    }
}