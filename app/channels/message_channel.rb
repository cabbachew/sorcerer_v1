class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    puts "Message received by server: #{data}"
    puts "*" * 100
    data['user'] = current_user
    ActionCable.server.broadcast('message', data)
  end
end
