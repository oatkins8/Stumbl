import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-favorite-event"
export default class extends Controller {
  static targets = ["link"]
  connect() {
    console.log("Hello World")
  }

  toggle(e) {
    e.preventDefault()
    let eventId = this.element.dataset.id
    let url = `/events/${eventId}/toggle_favorite`
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.getMetaValue("csrf-token")},
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        let newHeart = data.inserted_item
        this.linkTarget.innerHTML = newHeart
      })
  }
    getMetaValue = (name) => {
    const element = document.head.querySelector(`meta[name="${name}"]`)
    return element.getAttribute("content")
  }
}
