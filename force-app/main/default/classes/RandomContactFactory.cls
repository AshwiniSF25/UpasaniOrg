public class RandomContactFactory 
{
   
    public static list<contact> generateRandomContacts(Integer count,String lname)
    {

        Contact[] conlist = new List<Contact>();
        
            for(Integer i=0; i <count; i++)
            {
                Contact con = new Contact(FirstName= 'Test '+ i, Lastname= lname);
                conlist.add(con);
            }

        system.debug(conlist);
    return conlist; 
    }
}