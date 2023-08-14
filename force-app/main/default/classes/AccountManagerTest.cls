@isTest
public  class AccountManagerTest {
    
    @isTest
    static void mytest(){

        Account a = new Account(Name='Test acc');
        insert a;

        Contact c = new Contact(AccountId= a.id, firstname='test', LastName='poo');
        insert c;

        RestRequest request = new RestRequest();
        request.requestUri ='https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' + a.id+ '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account myacc = AccountManager.getAccount();

        system.assertEquals('Test acc', myacc.Name);
    }
}