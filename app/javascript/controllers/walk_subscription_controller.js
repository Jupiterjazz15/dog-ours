import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="walk-subscription"
export default class extends Controller {
  static values = { walkId: Number, currentUserId: Number  }
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
    // const currentUserIsSender = this.currentUserIdValue === data.sender_id; 
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

  }
  resetForm(event) {
    event.target.reset()
  }
}
