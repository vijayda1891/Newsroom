import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    this.element.addEventListener("turbo:frame-load", this.onFrameLoad)
  }

  disconnect() {
    this.element.removeEventListener("turbo:frame-load", this.onFrameLoad)
  }

  onFrameLoad = (event) => {
    // If the frame has content (non-empty), show the modal styles
    if (this.element.innerHTML.trim().length > 0) {
      document.body.classList.add("modal-open")
      // Optionally focus the first input
      const input = this.element.querySelector("input, textarea, button")
      if (input) input.focus()
    } else {
      // If frame is empty, ensure modal classes are removed
      document.body.classList.remove("modal-open")
    }
  }

  // Close button: clear the modal frame content
  close(event) {
    event?.preventDefault()
    this.element.innerHTML = ""
    document.body.classList.remove("modal-open")
  }

  // Clicking backdrop should close
  backgroundClick(event) {
    // Only close if clicked directly on backdrop (not on dialog)
    if (event.target === event.currentTarget) {
      this.close()
    }
  }

  // Stop clicks inside dialog from bubbling to the backdrop
  stopPropagation(event) {
    event.stopPropagation()
  }
}
