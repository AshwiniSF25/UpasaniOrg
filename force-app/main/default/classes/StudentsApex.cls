public class StudentsApex 
{
    public class StudentException extends Exception{}

    public static void processBefore(Student__c[] slist)
    {
        
        List<StudentErrorManagement__c> err =  new List<StudentErrorManagement__c>{};

        for(Student__c su : slist)
        {

        try 
        {
            if(su.Name == 'Test')
            {
                StudentErrorManagement__c sem =  new StudentErrorManagement__c(	Error_Name__c='Test', Reason__c ='not allowed ');
                err.add(sem);
                su.addError('Dont do that');
                throw new StudentException(' you are not allowed to do that');
            }
        } 
        catch (StudentException e ) 
        {
                system.debug('has error rollback now');
                system.debug('inserting now');
                system.debug('Hi');
                system.debug('inserting now2');

                Database.SaveResult[] srlistng = Database.insert(err);
                system.debug(srlistng);
        }
        
        }
    }
}


            // if(su.hasErrors())
            // {
            //     system.debug('has error rollback now');
            //     Database.Rollback(sp);
            //     system.debug('inserting now');
            //     Database.SaveResult[] srlistng = Database.insert(err);
            //     system.debug(srlistng);
            // }