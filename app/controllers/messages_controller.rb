class MessagesController < ApplicationController
  def index
    @messages = Message.all.order created_at: :desc
    # render stream: true
  end

  def poke_cow

    # CowsayJob.set(wait_until: (Time.now + 1.minute)).perform_later
    CowsayJob.perform_later

    # GeolocateAccountJob.set(wait: Date.tomorrow.noon).perform_later
 
    # Rails.queue.push reviews_search
    # Rails.queue.push(CowsayJob.new(user))
 
    # if Message.create body: Message.poke_cow
    #   redirect_to root_path
    # else
    #   redirect_to root_path, alert: 'The cow is broken'
    # end
    redirect_to root_path, notice: 'Cow at work...'
  end
end
