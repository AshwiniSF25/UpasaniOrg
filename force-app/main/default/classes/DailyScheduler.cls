public with sharing class DailyScheduler implements Schedulable 
{
    //execute
    public void execute(SchedulableContext ctx) 
    {
        System.debug('Staring Daily job of ETF ');
        ETFTrades.ProcessDailyTask();
    }


}