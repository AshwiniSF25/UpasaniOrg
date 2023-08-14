public class Book 
{
    public static void ProcessUpdates(Book__c[] booklist)
    {
        for (Book__c boo: booklist) 
        { 
            if (boo.CR_Certified__c == true ) 
            { 
              boo.Updated_Price__c = boo.Price__c * 2;  
            } 
        }
			
    }
     
    
}