import { LightningElement, wire } from "lwc";
import getAccountList from "@salesforce/apex/AccountController.getAccountList";

export default class ApexWireDemo extends LightningElement {
  //We can Wire an apex method to a property
  //We can Wire an apex method to a Function
  //@wire(apexMethodName, {apexMethodParams})
  //propertyOrFunction;
  @wire(getAccountList)
  accounts;
}
