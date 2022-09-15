import { LightningElement } from "lwc";

export default class LifeCycleParent extends LightningElement {
  isChildVisible = false;

  constructor() {
    super();
    console.log("PARENT constructor called");
  }

  connectedCallback() {
    console.log("PARENT connectedCallback called");
    // used to perform initialization tasks such as fetch data, set up caches or liste for events like
    // pub sub.c/helloConditionalRendering
    // Do NOT use it to change the state of a component, such as loading values or setting
    // properties. Use getters and setters instead.
  }

  renderedCallback() {
    console.log("PARENT renderedCallback called");
    // used after component is done rendering.
  }

  handleClick() {
    this.isChildVisible = !this.isChildVisible;
  }

  errorCallback(error, stack) {
    console.log(error);
    console.log(stack);
  }
}
