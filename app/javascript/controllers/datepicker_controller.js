import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  // static targets = ["startTime", "birthDate"]
  static values = { minDate: String }

  connect() {
    const format = "F j, Y";
    flatpickr(this.element, { minDate: this.minDateValue, altFormat: format } );
  }
}
