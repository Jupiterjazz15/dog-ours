import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="walk-subscription"
export default class extends Controller {
  static values = { walkId: Number }
  static targets = ["messages"]


  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "WalkChannel", id: this.walkIdValue },
      { received: data => this.#insertMessage(data) }
    )
  }
  #insertMessage(data) {
    // event.preventDefault();
    console.log("hello", data);
    this.messagesTarget.insertAdjacentHTML('beforeend', data);
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
  resetForm(event) {
    event.target.reset()
  }
}
