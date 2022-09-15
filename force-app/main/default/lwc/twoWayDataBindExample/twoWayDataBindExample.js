import { LightningElement, track } from "lwc";

export default class TwoWayDataBindExample extends LightningElement {
  fullname = "Awesome full name";
  title = "LWC";

  changeHandler(event) {
    this.title = event.target.value;
  }

  // Althoug @track could be applied to this object, js recommends to make a copy of the object
  @track address = {
    city: "Sao Paulo",
    postcode: 1234,
    country: "Brazil"
  };

  trackHandler(event) {
    this.address.city = event.target.value;
  }
  // without using @track, I could use the spread operator to make a copy of the property/object as follows
  //   address = {
  //     city: "Sao Paulo",
  //     postcode: 1234,
  //     country: "Brazil"
  //   };

  //   trackHandler(event) {
  //     this.address = { ...this.address, city: event.target.value };
  //   }
  // }

  // Getter example
  users = ["John", "Smith", "Mary"];
  num1 = 10;
  num2 = 20;

  get firstUser() {
    return this.users[0];
  }

  get multiply() {
    return this.num1 * this.num2;
  }
}
