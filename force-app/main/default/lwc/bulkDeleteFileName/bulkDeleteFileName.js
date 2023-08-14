import { LightningElement, track, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import getUploadedFiles from '@salesforce/apex/LWC_bulkDeleteRecords.getUploadedFiles';
import retrieveRecords from '@salesforce/apex/LWC_bulkDeleteRecords.retrieveRecordsCount';
import deleteRecords from '@salesforce/apex/LWC_bulkDeleteRecords.deleteRecords';
import cleanUpFiles from '@salesforce/apex/LWC_bulkDeleteRecords.cleanUpFiles';

export default class BulkDeleteFileName extends LightningElement 
{

    @api recordId = undefined;
    @api objectApiName;
    @track fileValue = undefined;
    @track totalRecords = undefined;

    @track hasRecords = undefined;
    @track batchProcess = false;

    @track spinner=false;
    @track hideButton =false;
    @track batchId = undefined;
    @track progressValue = undefined;

    @track optionsForFile = [];
    @track etfRecordToDeleteList = [];

    get hasData()
    {
        return this.hasRecords;
    }
    get options() 
    {
        return this.optionsForFile;
    }
   
    @wire (getUploadedFiles, {etfUploadId : "$recordId"}) wiredFileList({data, error})
    {
        if(data)
        {
            this.optionsForFile = [{"value" : null , "label" : 'None'}];
            for(var result of data)
                this.optionsForFile.push({label : result.Title, value : result.Title});
        }
        else if(error)
            console.log(error); 
    }

    handleChange(event) 
    {
        this.fileValue = event.detail.value;
        console.log('this is File Name ' + this.fileValue);
        console.log('This is object API ' +this.objectApiName);
        this.fetchRecordsCount();   
    } 

    handleOnClickCancel(event)
    {
        this.fileValue = undefined;
    }

    handleOnClickDelete(event)
    {
        this.spinner = true;
        this.batchProcess = true;
        this.hideButton = true;
        this.processDeletingRecords();
    }

    fetchRecordsCount()
    {
        retrieveRecords({recId: this.recordId, fileName: this.fileValue, objectName: this.objectApiName})
        .then(result =>
            {
                console.log('Records Count :  '+ result); 
                this.totalRecords = result;

                if(this.totalRecords > 0)
                {
                    this.hasRecords = true;
                }
                else
                {
                    this.hasRecords = false;
                }
            })
        .catch(error =>
            {
                this.failureNotification();
            })
    }

    processDeletingRecords()
    {
        deleteRecords({recId: this.recordId, fileName: this.fileValue, objectName: this.objectApiName})
        .then(result => 
            {
                console.log('Deleting via DML :  Status in progress bar ' + result);
                console.log('cleanup');
                this.cleanUpFilesForCSS();
                this.successNotification();

            })
        .catch( error =>
            {
                this.spinner = false;
                this.failureNotification('You do not have permission to delete records from this file.');
            })
    }

    cleanUpFilesForCSS()
    {
        cleanUpFiles({recId: this.recordId, fileName: this.fileValue, objectName: this.objectApiName})
        .then(result => 
            {
                console.log('File was deleted' + result);
            })
        .catch(error => 
            {

            })
    }

    
    successNotification()
    {
        this.progressValue = 0;
        this.batchProcess = false;
        this.hideButton = false;
        this.spinner = false;

        const evt = new ShowToastEvent({
            title: 'Records Deletion ',
            message: 'The records from selected file are deleted successfully.',
            variant: 'success'
        });
        this.dispatchEvent(evt);

        this.fileValue = undefined;
    }

    failureNotification(errMessage)
    {
        this.progressValue = 0;
        this.batchProcess = false;
        this.hideButton = false;
        this.spinner = false;

        const evtFail = new ShowToastEvent({
            title: 'Records Deletion failed',
            message: errMessage,
            variant: 'error'
        });
        this.dispatchEvent(evtFail);

        this.fileValue = undefined;
    }

    


}