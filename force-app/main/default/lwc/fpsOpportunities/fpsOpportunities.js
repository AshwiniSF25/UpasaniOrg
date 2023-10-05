import { LightningElement, wire, track, api} from 'lwc';
import getOpportunityByRecordTypeId from '@salesforce/apex/Opportunities.getOpportunityByRecordTypeId';
import { getRecord } from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';
import USER_ID from '@salesforce/user/Id';

export default class FpsOpportunities extends LightningElement
{
     //Display Opportunities 
     @track oppList;
     @track opps;
     @api recordId;
     profilename = undefined;

     @track showInlineEdits = false;

     @track columns = 
     [
         { label: 'Name', fieldName: 'Name'},
         { label: 'Amount ', fieldName: 'Amount', editable : this.showInlineEdits },    
         { label: 'Stage', fieldName: 'StageName' , editable : this.showInlineEdits },
         { label: 'Close Date', fieldName: 'CloseDate', editable : this.showInlineEdits  },
           
     ];

     @wire (getOpportunityByRecordTypeId, {recordId : '$recordId', recordTypeId :'0128c000002wSvuAAE' }) wiredopps(result)
     {
        this.opps= result;

        if(result.data)
        {
            this.oppList = result.data;
        }
        else if (result.error)
            console.log(result.error); 
             
              
     }

     @wire (getRecord, {recordId: USER_ID, fields: ['User.Profile.Name']}) getprofileDetails ({error,data})
     {
        console.log('In profile wire');
        if(data)
        {
            this.profilename = data.fields.Profile.displayValue;

            if(this.profilename == 'System Administrator')
            {
                console.log('You have edit access');
                this.showInlineEdits = true;
                refreshApex(this.oppList);
                console.log('refreshed');
            }
            else
            {
                console.log('You should not edit this .');
            }
        }
        else if(error)
            console.log('error');
        
     }
}