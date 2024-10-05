import { Controller } from "@hotwired/stimulus"
import { Calendar } from "@fullcalendar/core"

export default class extends Controller {
  static targets = ["conteiner"]
  static values = {
    events: Array
  }

  connect() {
    new Calendar(this.conteinerTarget, {
      initialView: "dayGridMonth",
      events: this.eventsValue
    })
  }
}
