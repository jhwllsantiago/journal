import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  toggleEditForm(e) {
    e.preventDefault();
    e.stopPropagation();
    document.getElementById(e.params["form"]).classList.toggle("d-none");
    document.getElementById(e.params["form"]).classList.toggle("mt-5");
    document.getElementById(e.params["body"]).classList.toggle("d-none");
  }
}
