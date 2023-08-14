public class CSAData_InsertRecords {

    public static void insertmethod(){
    CSA_Data__c[] datalist = new List<CSA_Data__c>();
    
    for(Integer i=0;i<30;i++)
    {
    CSA_Data__c a = new CSA_Data__c(Name='Test CSA ' + i, CSA_Category__c='San Francisco');
    datalist.add(a);
	}
    
    insert datalist;
    }

}