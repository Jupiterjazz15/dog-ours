import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = { minDate: String }

  connect() {
    const format = "F j, Y, H:i";
    flatpickr(this.element, {
      minDate: this.minDateValue,
      altFormat: format,
      enableTime: true,
      time_24hr: true,
      minuteIncrement: 15,
      disableMobile: true
    });
  }
}
