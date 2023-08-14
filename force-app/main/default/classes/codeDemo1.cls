public class codeDemo1{

/*
import { LightningElement, track, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getUploadedFiles from '@salesforce/apex/LWC_BulkDeleteRecords.getUploadedFiles';
import deleteRecords from '@salesforce/apex/LWC_BulkDeleteRecords.deleteRecords';
import checkStatus from '@salesforce/apex/LWC_BulkDeleteRecords.checkStatus';
import retrieveCount from '@salesforce/apex/LWC_BulkDeleteRecords.retrieveRecordsCount';

export default class BulkDeleteRecords extends LightningElement 
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
        console.log('This is object API' +this.objectApiName);
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
        retrieveCount({recId: this.recordId, fileName: this.fileValue, objectName: this.objectApiName})
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
                this.batchId = result;
                if(this.batchId != null)
                {
                    console.log('Deleting via batch Apex :  Status in progress bar');
                    this.checkStatus(this.batchId);
                }
                else
                {
                    console.log('Deleting via DML :  Status in progress bar');
                    this.successNotification();
                }
            })
        .catch( error =>
            {
                this.spinner = false;
                this.failureNotification('You do not have permission to delete records from this file.');
            })
    }

    checkStatus(batchIDrec)
    {
        console.log('Check Status Initiated with batch Id: ' + batchIDrec);

        var a = setInterval(() => 
        {
            checkStatus({BatchJobId: batchIDrec})
                .then(result => 
                {
                    let jobStatus = JSON.parse(result);
            
                    if(jobStatus.deleteProcessStatus == 'Processing')
                    {
                        this.progressValue = Math.round((jobStatus.deletedRecordsCount * 100)/ jobStatus.deleteTotalJobItem) ;
                        console.log('Now the Progress Value is  : '+this.progressValue);
                    }
                    if(jobStatus.deleteProcessStatus == 'Completed')
                    {
                        this.progressValue = 100;
                        clearInterval(a);
                        this.successNotification();
                    }
                })
                .catch(error => 
                {   
                    this.failureNotification('Process Deleteion Failed. Please Try again');
                })
        }, 5000);
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


---------------------html
<template>
    <div class="slds-box slds-text-heading_small">
        <lightning-card title="Select File to Bulk Delete Records" icon-name="custom:custom13">

            <lightning-combobox placeholder="Available Files ..."
                                value={fileValue}
                                options={options}
                                onchange={handleChange} >
                               
            </lightning-combobox>

            <br><br>
            <template if:true={fileValue}>
                <lightning-card>
                        <p style="text-align:center"  class="header-layout slds-theme_shade slds-var-p-around_x-small">
                            <span style="display: inline-block; padding-right: 5px">
                                <lightning-icon icon-name="doctype:csv" variant="success"></lightning-icon>
                            </span>
                            <span style="display: inline-block; padding-top: 5px">
                                <span style="white-space: break-spaces; font-size: medium; padding-left: 5px">
                                    <b> Selected File Name  : {fileValue}  ,</b>
                                    <b> Total Number of Records : {totalRecords} </b>
                                </span>
                            </span>
                         
                            <template if:true={hasData}>
                                <br> <br>
                                <template if:false={hideButton}>
                                    <span style="white-space: break-spaces; font-size: medium; padding-left: 5px">
                                        <b> Do you want to Bulk Delete records in this file ?  </b>
                                    </span>

                                    <br><br>
                                    <lightning-button   variant="brand" 
                                                        label="Delete Records" 
                                                        title="Delete Records" 
                                                        onclick={handleOnClickDelete} 
                                                        class="slds-m-left_x-small">
                                    </lightning-button>

                                    <lightning-button   variant="destructive" 
                                                        label="Cancel" 
                                                        title="Cancel Selection" 
                                                        onclick={handleOnClickCancel} 
                                                        class="slds-m-left_x-small">
                                    </lightning-button> 
                                </template>

                            </template>

                            <template if:true={spinner}>
                                <div class="slds-box slds-theme_shade" style="height:6rem;position:relative">
                                    <div class="slds-spinner_container">
                                      <div role="status" class="slds-spinner slds-spinner_medium slds-spinner_brand">
                                        <span class="slds-assistive-text">Loading</span>
                                        <div class="slds-spinner__dot-a"></div>
                                        <div class="slds-spinner__dot-b"></div>
                                      </div>
                                    </div>
                                  </div>
                            </template>

                            <template if:false={hasData}>
                                <div class="slds-truncate" style=" white-space: break-spaces; font-size: medium; padding-left: 5px; color: red">Records from this file are already deleted. Please select a different file to bulk delete . </div>
                            </template>
                        </p>
                    </lightning-card>  
            </template>

            <template if:true={batchProcess}>
                <div class="slds-box" >
                    <div class="slds-box slds-theme_shade" >
                        <p style="font-size: medium; color:blue">
                            <strong>Bulk Delete live Status  </strong>
                        </p>         
                    </div>
                    <div class="sdls-box">
                        <br>
                            <p style="font:large;font-weight: 100;"> Completed {progressValue} % out of total {totalRecords} records ... </p>
                            <lightning-progress-bar size="large" variant="circular" value={progressValue}></lightning-progress-bar>
                    </div>  
                </div>
            </template>
        </lightning-card>  
    </div>
</template>
*/
}