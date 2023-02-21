import { Controller } from "@hotwired/stimulus"
import messageChannel from "../channels/message_channel";

// Connects to data-controller="form"
export default class extends Controller {
  static targets = [ "input", "display" ]

  connect() {
    console.log("Hello from Stimulus")
  }

  clearInput() {
    this.inputTarget.value = ""
  }

  sendMessage(event) {
    event.preventDefault()
    const messageInput = this.inputTarget.value
    if(messageInput == '') return;
    const message = {
      body: messageInput
    }
    messageChannel.send({message: message})
  }
}