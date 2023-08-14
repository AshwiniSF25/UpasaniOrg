import { LightningElement, wire , api} from 'lwc';
import getCSAMatches from '@salesforce/apex/LWC_ControllerCSAMatch.getCSAMatches';

const columns = [
    { label: 'Id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name' },
    {
        type:"button",
        fixedWidth: 150,
        typeAttributes: {
            label: 'Match',
            name: 'Match',
            variant: 'brand'
        }
    },
];


export default class LWC_CSAMatch extends LightningElement {
    
    
    columns = columns;
    @api recordId;

    @wire(getCSAMatches ,{ recordId: '$recordId'  })
    CSA_Data__c;
}