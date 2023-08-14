trigger CSARecordTrigger on CSA_Data__c (after insert, after update, before insert, before update) 
{
    if(Trigger.isBefore)
  		CsaData.processBefore(Trigger.new); 

}