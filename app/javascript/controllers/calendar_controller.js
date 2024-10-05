import { Controller } from "@hotwired/stimulus"
import { Calendar } from "@fullcalendar/core"
import dayGridPlugin from "@fullcalendar/daygrid"

export default class extends Controller {
  static targets = ['container']
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

    this.calendar = new Calendar(this.containerTarget, {
      plugins: [dayGridPlugin],
      initialView: 'dayGridMonth',
      headerToolbar: {
        left: "prev,next today",
        center: "title",
        right: "",
      },
      events: this.eventsValue, // Usa os eventos passados pela variável do Rails
    });

    this.calendar.render(); // Renderiza o calendário na tela
  }

  disconnect() {
    if (this.calendar) {
      this.calendar.destroy() // Limpa o calendário ao desconectar o controller
    }
  }
}
