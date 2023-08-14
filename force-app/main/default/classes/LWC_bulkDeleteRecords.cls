global class LWC_bulkDeleteRecords 
{
   
    @AuraEnabled
    public static Integer retrieveRecordsCount(Id recId, String fileName, String objectName)
    {
        return  [Select Count() from ETF_Trade_Stage__c where File_Name__c = : fileName and ETF_Trade_Upload__c = : recId ];
         
    }

    @AuraEnabled(cacheable=true)
    public static List<ContentVersion> getUploadedFiles(String etfUploadId)
    {
        //query the contentDocument and add to set 
        set<Id> contentDocIds = new Set<Id>{};

        ContentDocumentLink[] cdl = [Select ContentDocumentId from ContentDocumentLink where LinkedEntityId = : etfUploadId];
        for(ContentDocumentLink c : cdl)
        {
            contentDocIds.add(c.ContentDocumentId);
        }

        ContentVersion[] cv = [Select Title from ContentVersion where ContentDocumentId In : contentDocIds ];
        system.debug('List of Files available to bulk delete '+ cv);

        return cv;
    }

    
    @AuraEnabled(cacheable = false)
    public static void deleteRecords(Id recId, String fileName, String objectName)
    {
        ETF_Trade_Stage__c[] etfRec = [Select Id from ETF_Trade_Stage__c where File_Name__c = : fileName and ETF_Trade_Upload__c = : recId ];
        system.debug('List of Records '+ etfRec + ' has total records  ' + etfRec.size());

        if (!etfRec.isEmpty())
        {
            system.debug('Starting the Deletion process');
            Database.delete(etfRec);
        }
    }

    @AuraEnabled
    public static void cleanUpFiles(Id recId, String fileName, String objectName)
    {
        system.debug('Strating to clean up '+ recId + ' file name  ' + fileName);
        ContentDocumentLink[] cdl = [select Id,LinkedEntityId, ContentDocument.title FROM ContentDocumentLink WHERE LinkedEntityId = : recId and ContentDocument.title = :fileName ];
        
        if(!cdl.isEmpty())
            delete cdl;
    }
    
}