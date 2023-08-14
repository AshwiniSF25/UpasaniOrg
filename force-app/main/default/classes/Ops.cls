public class Ops 
{
    /*
    public static void processBefore(ContentDocumentLink[] cdl)
    {
        List<StudentErrorManagement__c> err =  new List<StudentErrorManagement__c>{};
        system.debug(cdl);
        
        try 
        {
            for(ContentDocumentLink c : cdl)
            {
                StudentErrorManagement__c sem =  new StudentErrorManagement__c(	Error_Name__c='Test', Reason__c ='not allowed ');
                err.add(sem);
                c.addError('This file cannot be saved');
                throw new DmlException('noi');             
            }
        } 
        catch (Exception e )
        {
                system.debug('has error rollback now');
                system.debug('inserting now');
                Database.SaveResult[] srlistng = Database.insert(err);
                system.debug(srlistng);
        }
        
          
    }
    */

    
}