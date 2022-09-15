import { LightningElement } from "lwc";

export default class QuizApp extends LightningElement {
  selected = {}; //property used store the answers
  correctAnswers = 0; // property used to show the number of correct answers
  isSubmitted = false; // Used to show result after submitting the form through the button.
  myQuestions = [
    {
      id: "Question1",
      question: "Which one of the following is not a template loop?",
      answers: {
        a: "for:each",
        b: "iterator",
        c: "map loop"
      },
      correctAnswer: "c"
    },
    {
      id: "Question2",
      question:
        "Which of the file extensions is invalid in LWC component folder?",
      answers: {
        a: ".svg",
        b: ".apex",
        c: ".js"
      },
      correctAnswer: "b"
    },
    {
      id: "Question3",
      question: "Which of the following is not a directive?",
      answers: {
        a: "for:each",
        b: "if:true",
        c: "@track"
      },
      correctAnswer: "c"
    }
  ];

  // getter property used to disabled the button until all options are selected
  get allNotSelected() {
    return !(Object.keys(this.selected).length === this.myQuestions.length);
  }

  // getter property used to apply dynamic styling to our result
  get isScoredFull() {
    return `slds-text-heading_large ${
      this.myQuestions.length === this.correctAnswers
        ? "slds-text-color_success"
        : "slds-text-color_error"
    }`;
  }

  //method is called on every option selection click
  changeHandler(event) {
    const { name, value } = event.target;
    this.selected = { ...this.selected, [name]: value }; // >> this.selected={"Question1":"a"}
  }

  //form submit handler
  submitHandler(event) {
    event.preventDefault(); // used to prevent the <form> tag to refresh the page as its standard behavior.
    let correct = this.myQuestions.filter(
      (item) => this.selected[item.id] === item.correctAnswer
    );
    this.correctAnswers = correct.length;
    this.isSubmitted = true;
  }

  //form reset handler
  resetHandler() {
    this.selected = {};
    this.correctAnswers = 0;
    this.isSubmitted = false;
  }
}
