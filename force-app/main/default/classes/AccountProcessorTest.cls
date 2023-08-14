@istest
public  class AccountProcessorTest {
   
    @istest
    public static void myfirstmethod(){

        Account a = new Account(Name='Test Account'); 
        Contact c1 = new contact (Firstname='Test',Lastname='Sol',accountid =a.id);
        Contact c2 = new contact (firstname='Test2',Lastname='solu',accountid =a.id);

        insert a;
        insert c1;
        insert c2;

        List<Id> ids = new List<Id>();
        ids.add(a.id);

        Test.startTest();
        AccountProcessor.countContacts(ids);
        Test.stopTest();

    }
}