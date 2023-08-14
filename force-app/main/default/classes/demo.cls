public class demo {



    public static void processBefore(CSA_Data__c[] CsaNew)
    {
        String[] updateIds = new String[]{};
        Map<Id, Id> CsaConIds = new Map<Id, Id>();    
    	
        for (CSA_DATA__c csa: CsaNew) 
        { 
        	if (csa.Contact_Id__c != null ) { 
                updateIds.add (csa.contact_id__c);
       			CsaConIds.put(csa.Contact_ID__c, csa.Id);
        		} 
    	}
        if (!updateIds.isEmpty())
            processUpdatingFields(updateIds, CsaConIds);
    }

    //update the fields 
    public static void processUpdatingFields(String[] ids, Map<ID,ID> CsaConIds) 
    {
        List <Contact> UpdConList = new List <Contact> ();
        Contact[] toUpdCon = [select id, name from Contact where id in :ids];
    
        for (Contact con : toUpdCon)
        {
            con.CSA_Advisor_Name__c = CsaConIds.get(con.Id);
            UpdConList.add(con);   
        }
        
        if (UpdConList.size ()> 0) 
            Database.update(UpdConList, false);
    }

}