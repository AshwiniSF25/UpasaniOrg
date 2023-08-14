public class Contacts {

	public static void printQ(Contact[] c_new, Contact[] c_old, boolean isUpdate)
	{
    List<contact> listofcontacts = new List<Contact>();
    listofcontacts = [select Id, name from contact limit 10];
    system.debug('records on list are'+ listofcontacts);
    
    for(Contact c :c_new)
    {
        if(c.AccountId == null)
        system.debug('Record type is null');
        else
        system.debug('Record type is not null'+ c.AccountId);   
	}
	}
    
	public static void processBefore(Contact[] stats, Map<Id,Contact> mapcontacts, boolean isInsert)
    {
        Contact[] toProcess = new Contact[]{}; 
       
        for(Contact c2 : stats)
        	{
                system.debug(c2.Workflow_Recovery__c);
                system.debug(mapcontacts.get(c2.Id).Workflow_Recovery__c);
                if(c2.Workflow_Recovery__c && !mapcontacts.get(c2.Id).Workflow_Recovery__c)
                {
                    system.debug('we are here ');
                    toProcess.add(c2);
                }
                else
                {
                    system.debug('No we never reached there sorry ');
                }
           		
        	}
		system.debug(toProcess.isempty());
        system.debug(toProcess);
        
        
	}
}