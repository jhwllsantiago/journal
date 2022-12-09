import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  showForm(e) {
    e.preventDefault();
    e.stopPropagation();
    document.getElementById(e.params["form"]).classList.remove("d-none");
    document.getElementById(e.params["backdrop"]).classList.remove("d-none");
  }

  hideForm(e) {
    e.preventDefault();
    e.stopPropagation();

    document.getElementById(e.params["form"]).classList.add("d-none");
    document.getElementById(e.params["backdrop"]).classList.add("d-none");
  }
}
