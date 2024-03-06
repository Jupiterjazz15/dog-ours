import { Controller } from "@hotwired/stimulus"
// import autoComplete from "autoComplete"

export default class extends Controller {
  connect() {
    console.log(this.element)
    new SlimSelect({
      select: this.element
    })
  }
}
