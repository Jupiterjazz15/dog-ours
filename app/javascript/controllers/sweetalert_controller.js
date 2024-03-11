import { Controller } from "@hotwired/stimulus"
import "sweetalert2"

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = {
    title: String
  }

  connect() {
    console.log("hello")
    console.log("title", this.titleValue)

    Sweetalert2.fire({
      title: this.titleValue,
      text: 'Do you want to continue',
      icon: 'error',
      confirmButtonText: 'Cool'
    })

    // supprimer l'element
  }
}
