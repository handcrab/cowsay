class MessagesController < ApplicationController
  include ActionController::Live
  # Mime::Type.register "text/event-stream", :stream

  def index
    @messages = Message.all.order created_at: :desc
  end

  def poke_cow
    # CowsayJob.set(wait_until: (Time.now + 1.minute)).perform_later
    CowsayJob.perform_later
    # Rails.queue.push reviews_search
    # Rails.queue.push(CowsayJob.new(user))
    redirect_to root_path, notice: 'Cow at work...'
  end



  def broadcasting
    response.headers['Content-Type'] = 'text/event-stream'
    
    start_time = Time.zone.now    
    # TODO ???
    loop do
      Message.uncached do          
        Message.where("created_at > ?", start_time).each do |m|
          # response.stream.write "event: message\n"          
          response.stream.write %Q(data: #{m.to_json}\n\n)
          start_time = m.created_at
        end    
      end  
      sleep 2
    end
    
    # sse = SSE.new(response.stream, retry: 300, event: "message")
    # sse.write({ name: 'John'}, id: 10)
    # sse.write({ name: 'John'}, id: 10, event: "other-event")
    # sse.write({ name: 'John'}, id: 10, event: "other-event", retry: 500)
    # ensure
    # sse.close
    # render nothing: true
    rescue IOError
    ensure
    response.stream.close
  end
end
