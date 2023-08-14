public class ETFTrades 
{
/*
    public static List<String> weekends = new List<String>{'Saturday', 'Sunday'};

    public static void ProcessETFTradeUpload()
    {
        DateTime dt = DateTime.now();
        String CurrentMonth =  dt.format('MMMM');
        String CurrentYear = dt.format('YYYY');  
        Boolean RecordExsist = false;

        //system.debug('Initially its is '+ RecordExsist);

        ETF_Trade_Uploads__C[] etfRec = [ select name from ETF_Trade_Uploads__C ];
        //system.debug(etfRec);
     
        for(ETF_Trade_Uploads__C etf : etfRec)
        {
            if(etf.name.contains(CurrentMonth))
                RecordExsist = true;
                //system.debug(RecordExsist);
        }

        //system.debug('After looping value is '+ RecordExsist);

        if(!RecordExsist)
        createMonthlyETFRecord();

        

    }


    public static void createMonthlyETFRecord()
    {
        DateTime dt = DateTime.now();

        ETF_Trade_Uploads__C etfTradeUploadRecord = new ETF_Trade_Uploads__C(); 
        etfTradeUploadRecord.name = 'ETF Trade Upload - '+ dt.format('MMMM') + dt.year(); 
        Database.insert(etfTradeUploadRecord);
    }

    public static void setCutOffFlag(ETF_Trade_Uploads__C[] etfCutOff)
    {
        for (ETF_Trade_Uploads__C etf : etfCutOff)
        {
            etf.cut_off__c = true; 
        }
        
        if (!etfCutOff.isEmpty()) 
            Database.update(etfCutOff, false);
    }

    //code to find 11th business
    public static void ProcessCutoffDate()
    {
        
        ETF_Trade_Uploads__C[] etfRec2 = [ select name,date__c from ETF_Trade_Uploads__C ];

        for(ETF_Trade_Uploads__C etf2  : etfRec2)
        {
          //  Datetime CutOffDateFound = findBussinessDay(etf2.date__c);
           // system.debug(CutOffDateFound);
           // if(system.today() == CutOffDateFound)
            //    etf2.Cut_Off__c = true;
          
        }

    }




    public static void CalculateBusinessDays(Datetime finalDate,Integer NoOfBusinessDay)
    {
        Integer dayCounter = 0;
        
        while(NoOfBusinessDay > 0)
        {
            if(!(weekends.contains (finalDate.addDays(dayCounter++).formatGmt('EEEE'))))
                NoOfBusinessDay --;
        }

        system.debug(daycounter>0 ?finalDate.addDays(--dayCounter):finalDate);

       // return (daycounter>0 ?finalDate.addDays(--dayCounter):finalDate);
    } 
    */

}