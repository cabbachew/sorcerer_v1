import consumer from "./consumer"

const messageChannel = consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messageDisplay = document.querySelector('#message-display')
    messageDisplay.insertAdjacentHTML('beforeend', this.template(data))

    // Scroll to the last message
    messageDisplay.scrollTop = messageDisplay.scrollHeight;
  },

  template(data) {
    return `<article class="message" style="margin-bottom: var(--space-xs);
                                            display:flex;
                                            align-items:center;
                                            justify-content:space-between;
                                            ">
              <div style="color:var(--color-text-muted);
                          font-size:var(--font-size-xs);
                          margin-right:var(--space-m);
                          ">
                <p>${data.user.email}</p>
              </div>
              <div style="color:var(--color-glint);
                          flex:auto;
                          ">
                <p>${data.message.body}</p>
              </div>
            </article>`
  }
});

export default messageChannel