class CowsayJob < ActiveJob::Base
  queue_as :default

  def perform args = {} # (*args)
    cow_msg = `fortune | cowsay` # sleep 10 && 
    Message.create body: cow_msg
  end
end
