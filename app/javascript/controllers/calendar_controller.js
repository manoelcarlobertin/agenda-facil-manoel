import { Controller } from "@hotwired/stimulus"
import { Calendar } from "@fullcalendar/core"

export default class extends Controller {
  static targets = ["conteiner"]
  static values = {
    events: Array
  }

  connect() {
    const events = this.eventsValue.map((item) => ({
      title: item.name,
      start: item.started_at,
      end: item.finished_at,
      url: `/events/${item.id}/edit`,
    }));

    this.calendar = new Calendar(this.conteinerTarget, {
      plugins: [dayGridPlugin],
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "",
      },
      events,
    });

    this.calendar.render()
  }
}
