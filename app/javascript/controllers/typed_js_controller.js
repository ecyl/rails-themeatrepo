import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    console.log("In the typed_js controller");
    new Typed(this.element, {
      strings: ["meats", "beef", "pork", "poultry", "lamb"],
      typeSpeed: 70,
      startDelay: 1200,
      backSpeed: 70,
      backDelay: 900,
      loop: true
    });
  }
}
