import { Controller } from "@hotwired/stimulus"
import "sweetalert2"

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = {
    title: String,
    text: String,
    icon: String,
    confirmButtonText: String,
  }

  connect() {
    Sweetalert2.fire({
      title: this.titleValue,
      text: this.textValue,
      icon:
      confirmButtonText: ' OK <i class="fa-solid fa-dog"></i>'
    })

  }
}
