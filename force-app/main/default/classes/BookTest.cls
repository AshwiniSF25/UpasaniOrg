@isTest
public class BookTest {
	
    @isTest
    public static void testBooks()
    {
        Book__c b1 = new Book__c();
        b1.CR_Certified__c = true;
        b1.Title__c = 'Life of pie';
       	b1.Price__c = 20;
        
        Test.startTest();
        insert b1; 
        Test.stopTest();
        
        b1 = [Select Updated_Price__c from Book__c where id = : b1.Id ];
		system.assertEquals( 40 , b1.Updated_Price__c);        
    }
}