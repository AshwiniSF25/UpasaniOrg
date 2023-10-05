@isTest
public class TestVerifyDate {
    
    @isTest
    public static void test1(){

        Date Date1 = Date.newInstance(2022,03,02);
        Date Date2 = Date.newInstance(2022,04,01);

        Date Date3 = Date.newInstance(2022,03,21);

        Date result = VerifyDate.CheckDates(date1, date3);
        Date result2 = VerifyDate.CheckDates(date1, date2);

        system.debug('Ans is : '+result);
        
    }


}