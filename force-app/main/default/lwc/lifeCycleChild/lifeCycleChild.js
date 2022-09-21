import { LightningElement } from "lwc";

export default class LifeCycleParent extends LightningElement {
  constructor() {
    super();
    console.log("CHILD constructor called");
  }

  // used to perform initialization tasks such as fetch data, set up caches or liste for events like
  // pub sub.c/helloConditionalRendering
  // Do NOT use it to change the state of a component, such as loading values or setting
  // properties. Use getters and setters instead.
  connectedCallback() {
    console.log("CHILD connectedCallback called");
    // to explicit throw an error, use the following
    // throw new Error("Loading of CHILD component failed.");
  }

  renderedCallback() {
    console.log("CHILD renderedCallback called");
    // used after component is done rendering.
  }

  disconnectedCallback() {
    // eslint-disable-next-line no-alert
    alert("CHILD disconnected callback called.");
  }
}
