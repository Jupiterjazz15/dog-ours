import { Application } from "@hotwired/stimulus"
import "@rails/actioncable"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


  // document.addEventListener("DOMContentLoaded", function() {
  //   var searchContent = document.getElementById("content_message");
  //   if (searchContent) {
  //     searchContent.addEventListener("input", function() {
  //       if (window.location.href.includes("search")) {
  //         searchInput.value = "";
  //       }
  //     });
  //   }
  // });
