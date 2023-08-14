public class ParkLocator {
   
    public static List<String> country (String country)
    {
       ParkService.ParksImplPort  ps = new ParkService.ParksImplPort ();
       return  ps.byCountry(country);
    }
}