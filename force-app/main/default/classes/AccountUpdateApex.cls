public class AccountUpdateApex {

    public static void doprocess(Contact[] TriggerNewRecords)
    {
        Set <String> accID = New Set <String> (); 
    	
        For (Contact con: TriggerNewRecords) 
        { 
        if (con.AccountId != Null ) 
        { 
        accID.add (con.AccountId); 
        } 
    } 
    If (accID.size ()> 0) { 
        List <Account> upAccList = new List <Account> (); 
        For (Account ac: 
[SELECT Id, Field_Update__c FROM Account WHERE id in: AccID AND Field_Update__c != True]) { 
            ac.Field_Update__c = true; 
            UpAccList.add (ac); 
        } 
        If (upAccList.size ()> 0) 
            update upAccList; 
    } 
    }
}