class CowsayJob < ActiveJob::Base
  queue_as :default

  def perform args={topic: ''} # topic: 'ru'    
    cow_msg = `fortune #{args[:topic]} | cowsay` # sleep 10 && 
    Message.create body: cow_msg
  end
end
