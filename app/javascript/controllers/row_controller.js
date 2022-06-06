import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["row"]

  connect() {
    console.log("Row controller is now connected!")
  };

  sendToLink(event) {
    // event.preventDefault();
    const row = event.currentTarget;
    const butchery_id = row.dataset['butcheryId']
    window.location.href = `butcheries/${butchery_id}`
  }

  sendToAdd(event) {
    const row = event.currentTarget;
    window.location.href = `butcheries/new`

  }
}
