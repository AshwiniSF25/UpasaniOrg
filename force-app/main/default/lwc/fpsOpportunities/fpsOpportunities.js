import { LightningElement, wire, track, api} from 'lwc';
import getOpportunityByRecordTypeId from '@salesforce/apex/Opportunities.getOpportunityByRecordTypeId';

export default class FpsOpportunities extends LightningElement
{
     //Display Opportunities 
     @track oppList;
     @api recordId;

     @track columns = 
     [
         { label: 'Name', fieldName: 'Name' },
         { label: 'Amount ', fieldName: 'Amount' },    
         { label: 'Stage', fieldName: 'StageName' },
         { label: 'Close Date', fieldName: 'CloseDate' },
           
     ];

     @wire (getOpportunityByRecordTypeId, {recordId : '$recordId', recordTypeId :'0128c000002wSvuAAE' }) 
     wiredopps({data, error})
     {
         if(data)
             this.oppList = data;
         else if (error)
              console.log(error);      
     }
}