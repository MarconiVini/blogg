//app/assets/javascripts/controllers/trix_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    import("actiontext").catch(err => null)
    import("trix").catch(err => null)
  }
}