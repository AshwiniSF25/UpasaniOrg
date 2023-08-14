public class OnClickButton {

    Id objId = null;
    String cmd =null; 
    
    public OnClickButton(){
        objId = ApexPages.currentPage().getParameters().get('id');
		cmd = ApexPages.currentPage().getParameters().get('cmd');
        
        if(cmd == 'ncc')
        {
            Campaign[] cmps = [select Id, Name, RecordType.Name from Campaign where Id = :objId];
            system.debug(cmps);
            validateCommand(cmd,cmps);
        }
    }
    
    
    //method1 
    private void validateCommand(String cmd, Sobject[] recs)
    {
        if(cmd == 'ncc'){
            if(!recs.isEmpty()){
                system.debug(recs[0]);
            }
        }
    }
    
    public PageReference doProcessOnClick(){
        String theme = UserInfo.getUiThemeDisplayed();
        Boolean isLE = (theme == 'Theme4d' || theme == 'Theme4u');
        
        if(cmd == 'ncc'){
            system.debug('hi');
        }
    
        
        return null;
    }
    
}