@isTest
public class ParkLocatorTest {
    
    @isTest static void testCallout() {              
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
       
        String country = 'United States';
        List<String> expectedPark = new List<String>{'Yosemite','pika'};
        
        System.assertEquals(expectedPark, ParkLocator.country(country)); 
    }
}