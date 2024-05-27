import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = { minDate: String }
  static targets = ["date", "dateTime"]

  connect() {
    if (this.hasDateTarget) {
      flatpickr(this.dateTarget, {
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
        disableMobile: true
      });
    }

    if (this.hasDateTimeTarget) {
      const format = "F j, Y, H:i";
      flatpickr(this.dateTimeTarget, {
        altFormat: format,
        enableTime: true,
        time_24hr: true,
        minuteIncrement: 15,
        disableMobile: true
        });
    }
  }
}
