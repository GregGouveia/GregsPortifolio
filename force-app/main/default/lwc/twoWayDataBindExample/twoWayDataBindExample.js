import { LightningElement } from 'lwc';

export default class TwoWayDataBindExample extends LightningElement {
    fullname="Awesome full name";
    title="aura";

    changeHandler(event){
        this.title = event.target.value;
    }

}