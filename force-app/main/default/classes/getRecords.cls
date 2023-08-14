public with sharing class getRecords {
    
        @AuraEnabled(cacheable=true)
        public static List<Contact> getcontacts(){
            return [Select Name,AccountId,createdbyId,CSa_advisor_name__C from Contact limit 20];
        }

        @AuraEnabled(cacheable=true)
        public static List<Account> getAccounts(){
            return [Select Name,Active__C,Rating,Type,website from Account limit 20];
        }

        @AuraEnabled(cacheable=true)
        public static List<CSA_Data__c> getCSAData(){
            return [Select Name,CSA_firm__c from CSA_Data__c limit 20];
        }

    
}