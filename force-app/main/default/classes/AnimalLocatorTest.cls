@isTest
public class AnimalLocatorTest 
{
    
    @isTest
    static void testAnimalcalloutviaMock()
    {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    
    String actual = AnimalLocator.getAnimalNameById(1);
    String expected = 'majestic badger';
    System.assertEquals(actual,expected);

    }
}