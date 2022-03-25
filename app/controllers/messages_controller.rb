class MessagesController < ApplicationController
  def create
    # message = current_user.messages.create(params.require(:message).permit(:body))
    message = current_user.messages.build(params.require(:message).permit(:body))
    ActionCable.server.broadcast('chatroom_channel', message: message_render(message))
  end

  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end
end
