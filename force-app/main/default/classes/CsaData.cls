public class CsaData {

    public static void processBefore(CSA_DATA__c[] CsaNew)
    {
        Map<ID, Id> CsaConIds = new Map<ID, Id>();

        for (CSA_DATA__c csa: CsaNew) 
        { 
        	if (csa.Contact_Id__c != null ) { 
       			CsaConIds.put(csa.Contact_ID__c, csa.Id);
        		} 
    	}
        if (!csaConIds.isEmpty())
            processUpdatingFields(CsaConIds);	
    }
    
       //update the new fields           
       private static void processUpdatingFields(Map<ID,ID> CsaConIds)
       {
          Contact[] ContactList = [select id from Contact where id in :csaConIds.keyset()];
           
            for (Contact con : ContactList){
                	con.CSA_Advisor_Name__c = CsaConIds.get(con.Id);   
            }
            If (!ContactList.isEmpty()) 
            Database.update(ContactList, false);
       	
       }
    
  
        
}