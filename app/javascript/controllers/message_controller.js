import { Controller } from "@hotwired/stimulus"
import messageChannel from "../channels/message_channel";

// Connects to data-controller="form"
export default class extends Controller {
  static targets = [ "input", "display" ]

  connect() {
    console.log("Hello from the Message Controller")
    this.displayTarget.insertAdjacentHTML('beforeend', "<div id='offline-message'>Action Cable channel is currently offline. Please check the browser console for connection status.<div>")
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
    console.log("Sending message to server")
    messageChannel.send({message: message})
  }
}