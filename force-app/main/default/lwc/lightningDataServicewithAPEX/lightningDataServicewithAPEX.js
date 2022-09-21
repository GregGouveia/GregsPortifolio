import { LightningElement } from "lwc";

export default class LightningDataServicewithAPEX extends LightningElement {
  code = `Apex
  public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
      return [SELECT Id, Name, Type, Industry FROM Account LIMIT 5];
    }

    LWC-HTML
    <template>
  <lightning-card title="Apex Wire to Property Demo">
    <div class="slds-p-around_medium">
      <template if:true={accounts.data}>
        <template for:each={accounts.data} for:item="account">
          <div class="slds-box slds-box_xx-small" key={account.Id}>
            <p><strong>Name : </strong> {account.Name}</p>
            <p><strong>Type : </strong> {account.Type}</p>
            <p><strong>Industry : </strong> {account.Industry}</p>
          </div>
        </template>
      </template>
    </div>
  </lightning-card>
</template>

LWC-JS
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

  `;
}
