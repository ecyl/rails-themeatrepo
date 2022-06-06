import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    console.log("Row controller is now connected!")
  };

  sendToLink() {
    console.log("connected")
    const selected = document.querySelector().dataset[ 'butchery-id'];
    window.location.href = `butcheries/${selected}`
  }
}
