import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  showEditForm(e) {
    e.preventDefault();
    e.stopPropagation();
    document.getElementById(e.params["form"]).classList.remove("d-none");
    document.getElementById(e.params["backdrop"]).classList.remove("d-none");
  }

  hideEditForm(e) {
    e.preventDefault();
    e.stopPropagation();

    const forms = document.querySelectorAll(`.${e.params["form"]}`)
    for (const form of forms) {
      form.classList.add("d-none");
    }
    document.getElementById(e.params["backdrop"]).classList.add("d-none");
  }
}
