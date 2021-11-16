import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['menu']

  toggleMenuState (e) {
    e.preventDefault()

    this.menuTarget.classList.toggle('navbar-menu-open')
  }
}
