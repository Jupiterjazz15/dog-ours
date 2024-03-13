import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    const pageToElementMap = {
      '/': '.fa-house',
      '/walks': '.fa-magnifying-glass',
      '/bookings': '.fa-comment',
      '/dashboard': '.fa-shield-dog'
    };

    const currentPage = window.location.pathname;

    for (const [pageUrl, elementSelector] of Object.entries(pageToElementMap)) {
      if (pageUrl === currentPage) {
        const elementToHighlight = document.querySelector(elementSelector);
        elementToHighlight && elementToHighlight.classList.add('highlighted');
        break;
      }
    }
  }
}
