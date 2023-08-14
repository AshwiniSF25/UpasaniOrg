@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
   
    @HttpGet
    global static Account getAccount()
    {
        RestRequest request= RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');

        Account result = [Select id,name,(select id,firstname, lastname from contacts) from Account where Id = : accountId];

        return result;
    }

}