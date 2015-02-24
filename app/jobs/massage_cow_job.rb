class MassageCowJob < ActiveJob::Base
  queue_as :default
  RUN_EVERY = 1 # minute    
  # after_perform do |job|
  #   self.class.perform_later wait: 30.seconds
  # end
  def perform args={each_minute: RUN_EVERY}
    # call an other job
    CowsayJob.perform_later # topic: 'ru'
    
    self.class.perform_later wait: args[:each_minute].minute # re-queue
  end
end
