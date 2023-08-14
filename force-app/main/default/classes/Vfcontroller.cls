/*
To display the results of a getter method in a page, use the name of the getter method without the get 
prefix in an expression. For example, to display the result of the getName method in page markup, use {!name}:
*/

public without sharing class Vfcontroller 
{

    public Vfcontroller(ApexPages.StandardController std)
    {   
        String etfTradeId = null;
        etfTradeId = std.getId();

        system.debug('Id is '+ etfTradeId);

    }

    public string getName()
    {
        return 'VfController';
    }
    
}