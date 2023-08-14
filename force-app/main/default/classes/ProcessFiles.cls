public with sharing class ProcessFiles 
{
   /*
    public static void process1()
    {

        List<String[]> p1 = new list<String[]>();

        String Filename = 'Trade Date,IP ID,Fidelity ETF Ticker,Units,Price \n' +
        '11/29/2021,361,FCIQ,62,37.55\n' +
        '11/29/2021,371,FCIQ,50,26.2'
        ;

        p1 = Utlities.parseCSVFileAsList(Filename);
        system.debug(p1.size());
        
        system.debug('Headers '+p1[0]);

        system.debug('Trade Date '+ p1[1][0]);
        system.debug('IP ID '+ p1[1][1]);
        system.debug('Ticker '+ p1[1][2]);
        system.debug('Units '+ p1[1][3]);
        system.debug('Price '+ p1[1][4]);
        
        Raw_ETF_Trade__c[] rawlist =  new List<Raw_ETF_Trade__c>();

        for(Integer i=1 ; i< p1.size(); i++)
        {
            Raw_ETF_Trade__c rawobj = new Raw_ETF_Trade__c();
            rawobj.Trade_Date__c = p1[i][0];
            rawobj.IP_ID__c =  p1[i][1];
            rawobj.Fidelity_ETF_Ticker__c= p1[i][2];
            rawobj.Units__C = p1[i][3];
            rawobj.price__C=  p1[i][4];

            rawlist.add(rawobj);
        }

        system.debug(rawlist);

        if(!rawlist.isEmpty())
        Database.insert(rawlist, false);

        
    }

   public static void attachmentQuery()
   {
    String tp ='a088c00001FuFXQAA3';
    Attachment[] att = [select Id, Name from Attachment where ParentId = :tp and Name like '%.csv'];
    system.debug(att);

   }
   */

}