class MessagesController < ApplicationController
  def index
    @messages = Message.all.order created_at: :desc
  end

  def poke_cow
    if Message.create body: Message.poke_cow
      redirect_to root_path
    else
      redirect_to root_path, alert: 'The cow is broken'
    end
  end
end
