@isTest
public class CsaTest {

    @isTest
    public static void testcsaSingle(){
     
        //step1: create a contact object 
        Contact con = new Contact(FirstName='Ashwini', LastName ='Upasani');
        insert con; 
        
        //step2: create a Csa object 
        CSA_Data__c cdata = new CSA_Data__c(name='Test CSA1', CSA_category__c = 'Test cat', CSA_Firm__c ='Test firm');
        insert cdata; 

        //update Csa record with Contact ID - Match found
        Cdata.Contact_ID__c = con.id; 
        update cdata; 
        
        //fetch data before performing assert  
        con = [Select CSA_Advisor_Name__c from contact where id= : con.id];

        system.assertEquals(cdata.Id, con.CSA_Advisor_Name__c);
   
    }
     
    @isTest
    public static void testCsabulk()
    {
        
        //bulk 
        Contact[] datalist = new List<Contact>();
        for(Integer i=0; i <50 ; i++)
        {
            Contact con = new Contact(FirstName='Test Contact' + i, LastName ='dummy');
            datalist.add(con);
        }
        insert datalist;


        CSA_Data__c[] datalistCSA = new List<CSA_Data__c>();
        for(Integer i=0; i <50 ; i++)
        {
            CSA_Data__c cdata = new CSA_Data__c(name='Test CSA1', CSA_category__c = 'sameCat', CSA_Firm__c ='sameFirm');
            datalistCSA.add(cdata);
        }
        insert datalistCSA;

        CSA_Data__c[] Csalist = [Select id,name from CSA_Data__c where CSA_category__c = 'sameCat'];
        for(CSA_Data__c csa : Csalist)
        {
            Contact[] conlist = [Select id from Contact where LastName = 'dummy'];
            for(Contact c : conlist )
            {
                csa.Contact_ID__c = c.id;
            }
             
        }
        update Csalist;

        System.debug(csalist);



    
    }
    
}