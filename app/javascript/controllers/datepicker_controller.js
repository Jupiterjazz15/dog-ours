import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  // static targets = ["startTime", "birthDate"]
  static values = { minDate: String }

  connect() {
    const format = "F j, Y, H:i";
    flatpickr(this.element, {
      minDate: this.minDateValue,
      altFormat: format,
      enableTime: true, 
      time_24hr: true,
      minuteIncrement: 15,
    });
  }
}
