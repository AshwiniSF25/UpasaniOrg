import { LightningElement,wire, track  } from 'lwc';
import getcontacts from '@salesforce/apex/getRecords.getcontacts'
import getAccounts from '@salesforce/apex/getRecords.getAccounts'
import getCSAData from '@salesforce/apex/getRecords.getCSAData'


export default class Camptest extends LightningElement 
{
    //method 1 : direct binding 
    // @wire (getcontacts) wiredcontact;
    
    //method 2:using wire adaptor 
    //1. column, then call  


    //Display contacts 
    @track conList;
    @track columns = 
    [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Account ', fieldName: 'AccountId' },    
        { label: 'Owner', fieldName: 'createdbyId' },
        { label: 'CSA Record', fieldName: 'CSa_advisor_name__C' },
          
    ];
    @wire (getcontacts) wiredcontact({data, error}){
        if(data)
            this.conList = data;
        else if (error)
             console.log(error);      
    }


    //Display Accounts 
    @track AccList;
    @track columnsAcc = 
    [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Active  ', fieldName: 'Active__C' },    
        { label: 'Rating', fieldName: 'Rating' },
        { label: 'Type', fieldName: 'Type' },
        { label: 'Website', fieldName: 'website' },
          
    ];

    @wire (getAccounts) wiredAccount({data, error}){
        if(data)
            this.AccList = data;
        else if (error)
             console.log(error);      
    }



    }