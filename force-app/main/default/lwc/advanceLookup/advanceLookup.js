import { LightningElement, wire } from 'lwc';
import { getListUi } from 'lightning/uiListApi';

export default class AdvanceLookup extends LightningElement {
  selectedRecordId;
  recordOptions;
  selectedRecords = [];

  @wire(getListUi, { objectApiName: ['Object1__c', 'Object2__c'], listViewApiName: 'All' })
  wiredListViews({ data, error }) {
    if (data) {
      this.recordOptions = this.generateRecordOptions(data);
    } else if (error) {
      // Handle error if any
    }
  }

  generateRecordOptions(data) {
    let options = [];
    data.listViews.forEach((listView) => {
      listView.records.records.forEach((record) => {
        options.push({
          label: record.fields.Name.value,
          value: record.id
        });
      });
    });
    return options;
  }

  handleRecordSelection(event) {
    this.selectedRecordId = event.detail.value;
    const selectedOption = this.recordOptions.find((option) => option.value === this.selectedRecordId);
    if (selectedOption) {
      this.selectedRecords.push(selectedOption);
    }
  }

  handleRemoveRecord(event) {
    const recordId = event.target.dataset.recordId;
    this.selectedRecords = this.selectedRecords.filter((record) => record.value !== recordId);
  }
}
