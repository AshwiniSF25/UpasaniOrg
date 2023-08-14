public class AddPrimaryContact implements Queueable {
    
    private Contact contact; 
    private String stateAbb;

    
    public AddPrimaryContact(Contact inputCon,String inputStat)
    {
        this.contact = inputCon; 
        this.stateAbb = inputStat;
    }

    public void execute(QueueableContext context) 
    {
        List<Account> acc = [Select Id from Account where BillingState = : stateAbb ];

        List<Contact> con = new List<Contact>(); 

        for(Account a : acc)
        {
            Contact cont = contact.clone();
            cont.AccountId =  a.id;
            con.add( cont );
        }

        insert con;
    }

}