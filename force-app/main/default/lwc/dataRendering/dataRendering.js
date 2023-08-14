import { LightningElement } from 'lwc';

export default class DataRendering extends LightningElement {

    areDetailsVisible = false;

    handleChange(event) {
        this.areDetailsVisible = event.target.checked;
    }
}