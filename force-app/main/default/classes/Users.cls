public class Users {

    public static void processBefore(User [] usr)
    {
        List<Id> inactiveUsers = new List<Id> {}; 
     
        for (User u : usr) { 
           	if(u.IsActive == false)
                inactiveUsers.add(u.Id);
        }
        clearMembershipPortfolio(inactiveUsers);
    }
    public static void clearMembershipPortfolio(List<Id> inactiveUsers)
    {
		
        List<GroupMember> removeGm  = [ Select Id from GroupMember where UserOrGroupID IN: inactiveUsers ];
		system.debug(removeGm);		
      
        if(!removeGm.isEmpty()){
         	delete removeGm; 
        	}
    }
}